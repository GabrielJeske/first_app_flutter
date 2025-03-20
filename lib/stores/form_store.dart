import 'package:mobx/mobx.dart';

part 'form_store.g.dart';


class FormStore =_FormStoreBase with _$FormStore;

abstract class _FormStoreBase with Store{

   @observable
   ObservableMap<String, String> formValues = ObservableMap.of({});

   @observable
   ObservableMap<String, String?> formErrors = ObservableMap.of({
   });

   @computed
   bool get isFormValid => formErrors.values.every((error) => error == null);

   @action
   void setField(String chave, String value){


      formValues[chave]=value;
      validateField(chave, value);

      formValues = ObservableMap.of(formValues);
      formErrors = ObservableMap.of(formErrors);

   }

   @action
   void validateField(String chave, String value) {

      if (!formValues.containsKey(chave)) {
      formValues[chave] = '';
      formErrors[chave] = 'erro';

      
    }

      formValues[chave] = value;

      if (chave == 'email'){
         formErrors[chave] = _validateEmail(value);
      }else if (chave == 'cpf'){
         formErrors[chave] = _validateCpf(value);
      }else{
         formErrors[chave] = value.isEmpty ? 'Campo obrigatório' : null;
      }
   }
   

   String? _validateEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (email.isEmpty) return 'E-mail é obrigatório';
    if (!emailRegex.hasMatch(email)) return 'E-mail inválido';
    return null;
   }

    String? _validateCpf(String cpf) {
      final RegExp cpfRegex = RegExp(r'^\d{3}\.?\d{3}\.?\d{3}-?\d{2}$');
      if (cpf.isEmpty) return 'CPF é obrigatório';
      if (!cpfRegex.hasMatch(cpf)) return 'CPF inválido';  
      return null;
   }   

   @action
  void validateAllFields() {
    
      formErrors = ObservableMap.of({
        'nome': formValues['nome']?.isEmpty ?? true ? 'Campo obrigatório' : null,
        'cpf': formValues['cpf']?.isEmpty ?? true ? 'Campo obrigatório' : null,
        'email': formValues['email']?.isEmpty ?? true ? 'Campo obrigatório' : null,
        'endereco': formValues['endereco']?.isEmpty ?? true ? 'Campo obrigatório' : null,
        'bairro': formValues['bairro']?.isEmpty ?? true ? 'Campo obrigatório' : null,
        'cep': formValues['cep']?.isEmpty ?? true ? 'Campo obrigatório' : null,
        'n': formValues['n']?.isEmpty ?? true ? 'Campo obrigatório' : null,
      });
    
  }


}