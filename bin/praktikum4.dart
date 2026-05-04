const fullName = 'Falendi';
const nim = '411221004';

bool isPrime(int value) {
  if (value < 2) return false;
  for (var i = 2; i * i <= value; i++) {
    if (value % i == 0) return false;
  }
  return true;
}

void main() {
  for (var number = 0; number <= 201; number++) {
    if (isPrime(number)) {
      print('$number adalah bilangan prima');
      print('Nama: $fullName');
      print('NIM: $nim');
      print('');
    }
  }
}
