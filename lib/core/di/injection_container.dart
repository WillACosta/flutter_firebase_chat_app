import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/features/chat/chat.dart';
import 'package:firebase_auth_app/features/contacts/contacts.dart';
import 'package:firebase_auth_app/infra/infra.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentication/authentication.dart';
import '../../presentation/presentation.dart';

GetIt serviceLocator = GetIt.instance;

void setUpInjectionContainer() {
  // firebase services
  serviceLocator.registerSingleton(FirebaseAuth.instance);
  serviceLocator.registerSingleton(FirebaseFirestore.instance);

  // data layer
  serviceLocator.registerFactory<AuthenticationRepository>(
    () => CAuthenticationRepository(serviceLocator.get(), serviceLocator.get()),
  );
  serviceLocator.registerFactory<RegisterRepository>(
    () => CRegisterRepository(serviceLocator.get(), serviceLocator.get()),
  );
  serviceLocator.registerFactory(
    () => ContactsRepository(serviceLocator.get(), serviceLocator.get()),
  );
  serviceLocator.registerFactory<ChatRepository>(
    () => CChatRepository(serviceLocator.get(), serviceLocator.get()),
  );
  serviceLocator.registerFactory<SecureStorageService>(
    () => CSecureStorageService(),
  );

  // use cases
  serviceLocator.registerFactory(
    () => SignInUseCase(serviceLocator.get()),
  );
  serviceLocator.registerFactory(
    () => CreatePrivateChatUseCase(serviceLocator.get()),
  );
  serviceLocator.registerFactory(
    () => GetAllContactsUseCase(serviceLocator.get()),
  );
  serviceLocator.registerFactory(
    () => RegisterUserUseCase(serviceLocator.get(), serviceLocator.get()),
  );
  serviceLocator.registerFactory(
    () => SendMessageUseCase(serviceLocator.get()),
  );
  serviceLocator.registerFactory(
    () => GetChannelsByUserUseCase(serviceLocator.get()),
  );
  serviceLocator.registerFactory(
    () => GetUserUseCase(serviceLocator.get()),
  );
  serviceLocator.registerFactory(
    () => CreateGroupChannelUseCase(serviceLocator.get()),
  );
  serviceLocator.registerFactory(
    () => CreateOrListenToMessagesByChannelUseCase(
      serviceLocator.get(),
      serviceLocator.get(),
      serviceLocator.get(),
    ),
  );

  // view models
  serviceLocator.registerSingleton(SplashViewModel(serviceLocator.get()));
  serviceLocator.registerFactory(() => SigInViewModel(serviceLocator.get()));
  serviceLocator.registerFactory(() => RegisterViewModel(serviceLocator.get()));
  serviceLocator.registerFactory(
    () => HomeViewModel(
      serviceLocator.get(),
      serviceLocator.get(),
      serviceLocator.get(),
    ),
  );

  serviceLocator.registerFactory(
    () => ChatViewModel(
      serviceLocator.get(),
      serviceLocator.get(),
      serviceLocator.get(),
    ),
  );
}
