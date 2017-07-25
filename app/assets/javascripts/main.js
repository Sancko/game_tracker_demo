var GameTracker = angular.module('GameTracker', []);

GameTracker.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.headers.common['Accept'] = 'application/json, text/javascript';
    $httpProvider.defaults.headers.common['Content-Type'] = 'application/json; charset=utf-8';
}]);

GameTracker.controller('MainCtrl', ['$scope', '$http', function ($scope, $http) {
  $scope.games = [];
  $scope.game = {name: '', store: ''};
  $scope.employees = [];
  $scope.employee = {name: '', speciality: ''};
  $scope.employeesBySpecialities = [];

  $http.get('/games').then(function (resp) {
    $scope.games = resp.data.games;
  });

  $http.get('/employees/by_speciality').then(function (resp) {
    $scope.employeesBySpecialities = resp.data.specialities;
  });

  $http.get('/employees').then(function (resp) {
    $scope.employees = resp.data.employees;
  });

  $scope.createGame = function () {
    $http.post('/games', $scope.game).then(function (resp) {
      $scope.games.push(resp.data.game);
      $scope.game = {name: '', store: ''};
    })
  };

  $scope.createEmployee = function () {
    $http.post('/employees', $scope.employee).then(function (resp) {
      $scope.employees.push(resp.data.employee);
      $scope.employee = {name: '', speciality: ''};
    })
  };


  $scope.toggleEdit = function (game) {
    // console.log(game);

    if(game.editable) {
      game.employee_ids = Object.keys(game.employees).map(function (speciality) {
        console.log(game.employees[speciality]);
        return game.employees[speciality][0] ? game.employees[speciality][0].id : null
      }).filter(id => id !== null);

      $http.put('/games/' + game.id, {game: game}).then(function (resp) {
        game = resp.data.game;
      });
    }

    game.editable = !game.editable;
  };

  $scope.deleteEmployee = function (employee) {
    for(var i in $scope.employees) {
      if($scope.employees[i].id === employee.id) {
        $http.delete('/employees/' + employee.id).then(function (resp) {
          $scope.employees.splice(i, 1);

          $http.get('/games').then(function (resp) {
            $scope.games = resp.data.games;
          });

          $http.get('/employees/by_speciality').then(function (resp) {
            $scope.employeesBySpecialities = resp.data.specialities;
          });
        });
        break;
      }
    }
  }
}]);
