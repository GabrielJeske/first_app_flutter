// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormStore on _FormStoreBase, Store {
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_FormStoreBase.emailError'))
          .value;
  Computed<String?>? _$cpfErrorComputed;

  @override
  String? get cpfError =>
      (_$cpfErrorComputed ??= Computed<String?>(() => super.cpfError,
              name: '_FormStoreBase.cpfError'))
          .value;
  Computed<String?>? _$cnpjErrorComputed;

  @override
  String? get cnpjError =>
      (_$cnpjErrorComputed ??= Computed<String?>(() => super.cnpjError,
              name: '_FormStoreBase.cnpjError'))
          .value;

  late final _$emailAtom = Atom(name: '_FormStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$cpfAtom = Atom(name: '_FormStoreBase.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$cnpjAtom = Atom(name: '_FormStoreBase.cnpj', context: context);

  @override
  String get cnpj {
    _$cnpjAtom.reportRead();
    return super.cnpj;
  }

  @override
  set cnpj(String value) {
    _$cnpjAtom.reportWrite(value, super.cnpj, () {
      super.cnpj = value;
    });
  }

  late final _$formAtom = Atom(name: '_FormStoreBase.form', context: context);

  @override
  String get form {
    _$formAtom.reportRead();
    return super.form;
  }

  @override
  set form(String value) {
    _$formAtom.reportWrite(value, super.form, () {
      super.form = value;
    });
  }

  late final _$isValidAtom =
      Atom(name: '_FormStoreBase.isValid', context: context);

  @override
  bool get isValid {
    _$isValidAtom.reportRead();
    return super.isValid;
  }

  @override
  set isValid(bool value) {
    _$isValidAtom.reportWrite(value, super.isValid, () {
      super.isValid = value;
    });
  }

  late final _$_FormStoreBaseActionController =
      ActionController(name: '_FormStoreBase', context: context);

  @override
  void setCnpj(String value) {
    final _$actionInfo = _$_FormStoreBaseActionController.startAction(
        name: '_FormStoreBase.setCnpj');
    try {
      return super.setCnpj(value);
    } finally {
      _$_FormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$_FormStoreBaseActionController.startAction(
        name: '_FormStoreBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_FormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_FormStoreBaseActionController.startAction(
        name: '_FormStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_FormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setForm(String value) {
    final _$actionInfo = _$_FormStoreBaseActionController.startAction(
        name: '_FormStoreBase.setForm');
    try {
      return super.setForm(value);
    } finally {
      _$_FormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateForm() {
    final _$actionInfo = _$_FormStoreBaseActionController.startAction(
        name: '_FormStoreBase.validateForm');
    try {
      return super.validateForm();
    } finally {
      _$_FormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
cpf: ${cpf},
cnpj: ${cnpj},
form: ${form},
isValid: ${isValid},
emailError: ${emailError},
cpfError: ${cpfError},
cnpjError: ${cnpjError}
    ''';
  }
}
