# Identity Pocket

A native SwiftUI portfolio project exploring European Digital Identity (EUDI) wallet flows, starting with privacy-preserving age verification.

## Project status

The repository currently contains the initial Xcode application and generated test targets. Credential issuance, storage, presentation, and verification are planned; they are not implemented yet.

This is an educational demonstration, not a certified EUDI Wallet. Initial credentials will use fictional identities and a test issuer.

## Intended demonstration

1. Receive a signed test credential from an issuer.
2. Review and store the credential in the iOS wallet.
3. Scan a demo verifier's age request.
4. Review the requester and the exact attribute being shared.
5. Authorize a presentation of an over-18 attribute.
6. Have the verifier independently validate the proof.

The first milestone uses explicitly labeled preview data. It must not claim that cryptographic verification has happened.

## Run the project

1. Open `Identity-Pocket/Identity-Pocket.xcodeproj` in Xcode.
2. Select the application scheme and an installed iPhone Simulator.
3. Run with Command-R.
4. Run the test targets with Command-U.

The project was created with an iOS deployment target of 26.2 and includes additional platform destinations. The first implementation task is to focus the app on iPhone. Check deployment requirements again when selecting EUDI dependencies.

## Roadmap

| Milestone | Acceptance criteria | Status |
| --- | --- | --- |
| Foundation | iPhone app builds; generated tests run; repository excludes personal Xcode state | Next |
| Wallet shell | Wallet, Activity, Settings; empty wallet; accessible labels; visible demo status | Planned |
| Credential model | Fictional credential details; deterministic expiry logic with meaningful unit tests | Planned |
| Protocol integration | Pin compatible EUDI dependencies; issue and present one credential using reference services | Planned |
| Age sharing | Validate requests; consent; biometric authorization; verifier checks proof | Planned |
| Showcase | Failure cases, documentation, repeatable setup, screenshots, short video | Planned |
| German eID extension | AusweisApp integration and service access; verified data feeds credential issuance | Later |

## Engineering approach

- SwiftUI for the native interface, Swift concurrency for asynchronous work, and Swift Package Manager for dependencies.
- Use maintained EUDI libraries for protocol and cryptographic functionality; do not implement those protocols from scratch.
- Start with one compatible credential format and one end-to-end flow.
- Introduce abstractions when integration needs them, keeping the initial app small.
- Do not commit real identity data, PINs, secrets, or private keys, or log sensitive credential contents.
- Clearly distinguish preview data, received credentials, sent presentations, and verifier acceptance.

## References

- [EUDI architecture and reference framework](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework)
- [EUDI iOS Wallet Kit](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-wallet-kit)
- [EUDI iOS reference application](https://github.com/eu-digital-identity-wallet/eudi-app-ios-wallet-ui)
- [AusweisApp SDK](https://www.ausweisapp.bund.de/software-development-kit-sdk)
