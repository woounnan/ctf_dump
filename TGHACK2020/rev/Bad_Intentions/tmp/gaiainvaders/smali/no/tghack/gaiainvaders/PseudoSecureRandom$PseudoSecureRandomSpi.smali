.class final Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;
.super Ljava/security/SecureRandomSpi;
.source "PseudoSecureRandom.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lno/tghack/gaiainvaders/PseudoSecureRandom;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PseudoSecureRandomSpi"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0010\u0010\u0007\u001a\u00020\u00032\u0006\u0010\u0008\u001a\u00020\tH\u0014J\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u0003H\u0014J\u0010\u0010\r\u001a\u00020\u000b2\u0006\u0010\u0002\u001a\u00020\u0003H\u0014J\u0010\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\u0002\u001a\u00020\u0003H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;",
        "Ljava/security/SecureRandomSpi;",
        "seed",
        "",
        "([B)V",
        "cipher",
        "Lorg/bouncycastle/crypto/engines/Salsa20Engine;",
        "engineGenerateSeed",
        "length",
        "",
        "engineNextBytes",
        "",
        "out",
        "engineSetSeed",
        "initialise",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field private final cipher:Lorg/bouncycastle/crypto/engines/Salsa20Engine;


# direct methods
.method public constructor <init>([B)V
    .locals 1

    const-string v0, "seed"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-direct {p0}, Ljava/security/SecureRandomSpi;-><init>()V

    .line 42
    new-instance v0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;

    invoke-direct {v0}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;-><init>()V

    iput-object v0, p0, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;->cipher:Lorg/bouncycastle/crypto/engines/Salsa20Engine;

    .line 43
    invoke-direct {p0, p1}, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;->initialise([B)V

    return-void
.end method

.method private final initialise([B)V
    .locals 4

    const/16 v0, 0x20

    new-array v0, v0, [B

    .line 18
    new-instance v1, Lorg/bouncycastle/crypto/digests/SHA256Digest;

    invoke-direct {v1}, Lorg/bouncycastle/crypto/digests/SHA256Digest;-><init>()V

    .line 19
    array-length v2, p1

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v3, v2}, Lorg/bouncycastle/crypto/digests/SHA256Digest;->update([BII)V

    .line 20
    invoke-virtual {v1, v0, v3}, Lorg/bouncycastle/crypto/digests/SHA256Digest;->doFinal([BI)I

    const/16 p1, 0x8

    new-array p1, p1, [B

    .line 23
    iget-object v1, p0, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;->cipher:Lorg/bouncycastle/crypto/engines/Salsa20Engine;

    new-instance v2, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    new-instance v3, Lorg/bouncycastle/crypto/params/KeyParameter;

    invoke-direct {v3, v0}, Lorg/bouncycastle/crypto/params/KeyParameter;-><init>([B)V

    check-cast v3, Lorg/bouncycastle/crypto/CipherParameters;

    invoke-direct {v2, v3, p1}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    check-cast v2, Lorg/bouncycastle/crypto/CipherParameters;

    const/4 p1, 0x1

    invoke-virtual {v1, p1, v2}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    return-void
.end method


# virtual methods
.method protected engineGenerateSeed(I)[B
    .locals 0

    .line 36
    new-array p1, p1, [B

    .line 37
    invoke-virtual {p0, p1}, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;->engineNextBytes([B)V

    return-object p1
.end method

.method protected engineNextBytes([B)V
    .locals 7

    const-string v0, "out"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    array-length v0, p1

    new-array v2, v0, [B

    .line 32
    iget-object v1, p0, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;->cipher:Lorg/bouncycastle/crypto/engines/Salsa20Engine;

    array-length v4, p1

    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object v5, p1

    invoke-virtual/range {v1 .. v6}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->processBytes([BII[BI)I

    return-void
.end method

.method protected engineSetSeed([B)V
    .locals 1

    const-string v0, "seed"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    invoke-direct {p0, p1}, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;->initialise([B)V

    return-void
.end method
