import 'package:brasil_fields/brasil_fields.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';


class FormStore =_FormStoreBase with _$FormStore;

abstract class _FormStoreBase with Store{

    @observable
    String email = '';
    
    @observable
    String cpf = '';

    
    @observable
    String cnpj = '';

    
    @observable
    String form = '';

    
    @observable
    bool isValid = false ;

    @action
    void setCnpj(String value) {
      cnpj = value;
    }

     @action
    void setCpf(String value) {
      cpf = value;
    }

     @action
    void setEmail(String value) {
      email = value;
    }

     @action
    void setForm(String value) {
      form = value;
    }
    
     @computed
  String? get emailError {
    if (email.isEmpty) return 'Digite seu e-mail';
    if (!isEmail(email)) return 'E-mail inválido';
    return null;
  }

  @computed
  String? get cpfError {
    if (cpf.isEmpty) return 'Digite seu CPF';
    if (!CPFValidator.isValid(cpf)) return 'CPF inválido';
    return null;
  }

  @computed
  String? get cnpjError {
    if (cnpj.isEmpty) return 'Digite seu CNPJ';
    if (!CNPJValidator.isValid(cnpj)) return 'CNPJ inválido';
    return null;
  }

   @action
  void validateForm() {
    isValid = emailError == null && cpfError == null && cnpjError == null;
  }

}