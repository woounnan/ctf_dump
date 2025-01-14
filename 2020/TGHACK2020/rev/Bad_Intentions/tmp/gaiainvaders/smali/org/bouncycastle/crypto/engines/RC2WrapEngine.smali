.class public Lorg/bouncycastle/crypto/engines/RC2WrapEngine;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/bouncycastle/crypto/Wrapper;


# static fields
.field private static final IV2:[B


# instance fields
.field digest:[B

.field private engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

.field private forWrapping:Z

.field private iv:[B

.field private param:Lorg/bouncycastle/crypto/CipherParameters;

.field private paramPlusIV:Lorg/bouncycastle/crypto/params/ParametersWithIV;

.field sha1:Lorg/bouncycastle/crypto/Digest;

.field private sr:Ljava/security/SecureRandom;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->IV2:[B

    return-void

    :array_0
    .array-data 1
        0x4at
        -0x23t
        -0x5et
        0x2ct
        0x79t
        -0x18t
        0x21t
        0x5t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lorg/bouncycastle/crypto/util/DigestFactory;->createSHA1()Lorg/bouncycastle/crypto/Digest;

    move-result-object v0

    iput-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->sha1:Lorg/bouncycastle/crypto/Digest;

    const/16 v0, 0x14

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->digest:[B

    return-void
.end method

.method private calculateCMSKeyChecksum([B)[B
    .locals 5

    const/16 v0, 0x8

    new-array v1, v0, [B

    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->sha1:Lorg/bouncycastle/crypto/Digest;

    array-length v3, p1

    const/4 v4, 0x0

    invoke-interface {v2, p1, v4, v3}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->sha1:Lorg/bouncycastle/crypto/Digest;

    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->digest:[B

    invoke-interface {p1, v2, v4}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    iget-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->digest:[B

    invoke-static {p1, v4, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method

.method private checkCMSKeyChecksum([B[B)Z
    .locals 0

    invoke-direct {p0, p1}, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->calculateCMSKeyChecksum([B)[B

    move-result-object p1

    invoke-static {p1, p2}, Lorg/bouncycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result p1

    return p1
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 1

    const-string v0, "RC2"

    return-object v0
.end method

.method public init(ZLorg/bouncycastle/crypto/CipherParameters;)V
    .locals 1

    iput-boolean p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->forWrapping:Z

    new-instance p1, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    new-instance v0, Lorg/bouncycastle/crypto/engines/RC2Engine;

    invoke-direct {v0}, Lorg/bouncycastle/crypto/engines/RC2Engine;-><init>()V

    invoke-direct {p1, v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    instance-of p1, p2, Lorg/bouncycastle/crypto/params/ParametersWithRandom;

    if-eqz p1, :cond_0

    check-cast p2, Lorg/bouncycastle/crypto/params/ParametersWithRandom;

    invoke-virtual {p2}, Lorg/bouncycastle/crypto/params/ParametersWithRandom;->getRandom()Ljava/security/SecureRandom;

    move-result-object p1

    iput-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->sr:Ljava/security/SecureRandom;

    invoke-virtual {p2}, Lorg/bouncycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object p2

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/security/SecureRandom;

    invoke-direct {p1}, Ljava/security/SecureRandom;-><init>()V

    iput-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->sr:Ljava/security/SecureRandom;

    :goto_0
    instance-of p1, p2, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    const/16 v0, 0x8

    if-eqz p1, :cond_3

    check-cast p2, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iput-object p2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->paramPlusIV:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iget-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->paramPlusIV:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    invoke-virtual {p1}, Lorg/bouncycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object p1

    iput-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->iv:[B

    iget-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->paramPlusIV:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    invoke-virtual {p1}, Lorg/bouncycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object p1

    iput-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->param:Lorg/bouncycastle/crypto/CipherParameters;

    iget-boolean p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->forWrapping:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->iv:[B

    if-eqz p1, :cond_1

    array-length p1, p1

    if-ne p1, v0, :cond_1

    goto :goto_1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "IV is not 8 octets"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "You should not supply an IV for unwrapping"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    iput-object p2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->param:Lorg/bouncycastle/crypto/CipherParameters;

    iget-boolean p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->forWrapping:Z

    if-eqz p1, :cond_4

    new-array p1, v0, [B

    iput-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->iv:[B

    iget-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->sr:Ljava/security/SecureRandom;

    iget-object p2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->iv:[B

    invoke-virtual {p1, p2}, Ljava/security/SecureRandom;->nextBytes([B)V

    new-instance p1, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iget-object p2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->param:Lorg/bouncycastle/crypto/CipherParameters;

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->iv:[B

    invoke-direct {p1, p2, v0}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    iput-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->paramPlusIV:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    :cond_4
    :goto_1
    return-void
.end method

.method public unwrap([BII)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/bouncycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    iget-boolean v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->forWrapping:Z

    if-nez v0, :cond_7

    if-eqz p1, :cond_6

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    move-result v0

    rem-int v0, p3, v0

    if-nez v0, :cond_5

    new-instance v0, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->param:Lorg/bouncycastle/crypto/CipherParameters;

    sget-object v2, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->IV2:[B

    invoke-direct {v0, v1, v2}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    new-array v0, p3, [B

    invoke-static {p1, p2, v0, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/4 p1, 0x0

    :goto_0
    array-length p2, v0

    iget-object p3, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {p3}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    move-result p3

    div-int/2addr p2, p3

    if-ge p1, p2, :cond_0

    iget-object p2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {p2}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    move-result p2

    mul-int p2, p2, p1

    iget-object p3, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {p3, v0, p2, v0, p2}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    array-length p1, v0

    new-array p1, p1, [B

    const/4 p2, 0x0

    :goto_1
    array-length p3, v0

    if-ge p2, p3, :cond_1

    array-length p3, v0

    add-int/lit8 v1, p2, 0x1

    sub-int/2addr p3, v1

    aget-byte p3, v0, p3

    aput-byte p3, p1, p2

    move p2, v1

    goto :goto_1

    :cond_1
    const/16 p2, 0x8

    new-array p3, p2, [B

    iput-object p3, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->iv:[B

    array-length p3, p1

    sub-int/2addr p3, p2

    new-array p3, p3, [B

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->iv:[B

    invoke-static {p1, v2, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v0, p1

    sub-int/2addr v0, p2

    invoke-static {p1, p2, p3, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    new-instance p1, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->param:Lorg/bouncycastle/crypto/CipherParameters;

    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->iv:[B

    invoke-direct {p1, v0, v1}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    iput-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->paramPlusIV:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iget-object p1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->paramPlusIV:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    invoke-virtual {p1, v2, v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    array-length p1, p3

    new-array p1, p1, [B

    array-length v0, p3

    invoke-static {p3, v2, p1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/4 p3, 0x0

    :goto_2
    array-length v0, p1

    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v1}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    move-result v1

    div-int/2addr v0, v1

    if-ge p3, v0, :cond_2

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    move-result v0

    mul-int v0, v0, p3

    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v1, p1, v0, p1, v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    add-int/lit8 p3, p3, 0x1

    goto :goto_2

    :cond_2
    array-length p3, p1

    sub-int/2addr p3, p2

    new-array p3, p3, [B

    new-array v0, p2, [B

    array-length v1, p1

    sub-int/2addr v1, p2

    invoke-static {p1, v2, p3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v1, p1

    sub-int/2addr v1, p2

    invoke-static {p1, v1, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-direct {p0, p3, v0}, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->checkCMSKeyChecksum([B[B)Z

    move-result p1

    if-eqz p1, :cond_4

    array-length p1, p3

    aget-byte p2, p3, v2

    and-int/lit16 p2, p2, 0xff

    const/4 v0, 0x1

    add-int/2addr p2, v0

    sub-int/2addr p1, p2

    const/4 p2, 0x7

    if-gt p1, p2, :cond_3

    aget-byte p1, p3, v2

    new-array p1, p1, [B

    array-length p2, p1

    invoke-static {p3, v0, p1, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1

    :cond_3
    new-instance p1, Lorg/bouncycastle/crypto/InvalidCipherTextException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "too many pad bytes ("

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v1, p3

    aget-byte p3, p3, v2

    and-int/lit16 p3, p3, 0xff

    add-int/2addr p3, v0

    sub-int/2addr v1, p3

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/bouncycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Lorg/bouncycastle/crypto/InvalidCipherTextException;

    const-string p2, "Checksum inside ciphertext is corrupted"

    invoke-direct {p1, p2}, Lorg/bouncycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    new-instance p1, Lorg/bouncycastle/crypto/InvalidCipherTextException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Ciphertext not multiple of "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {p3}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/bouncycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    new-instance p1, Lorg/bouncycastle/crypto/InvalidCipherTextException;

    const-string p2, "Null pointer as ciphertext"

    invoke-direct {p1, p2}, Lorg/bouncycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Not set for unwrapping"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public wrap([BII)[B
    .locals 5

    iget-boolean v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->forWrapping:Z

    if-eqz v0, :cond_6

    add-int/lit8 v0, p3, 0x1

    rem-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_0

    rsub-int/lit8 v1, v1, 0x8

    add-int/2addr v1, v0

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    new-array v1, v1, [B

    int-to-byte v2, p3

    const/4 v3, 0x0

    aput-byte v2, v1, v3

    const/4 v2, 0x1

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length p1, v1

    sub-int/2addr p1, p3

    sub-int/2addr p1, v2

    new-array p1, p1, [B

    array-length p2, p1

    if-lez p2, :cond_1

    iget-object p2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->sr:Ljava/security/SecureRandom;

    invoke-virtual {p2, p1}, Ljava/security/SecureRandom;->nextBytes([B)V

    array-length p2, p1

    invoke-static {p1, v3, v1, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    invoke-direct {p0, v1}, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->calculateCMSKeyChecksum([B)[B

    move-result-object p1

    array-length p2, v1

    array-length p3, p1

    add-int/2addr p2, p3

    new-array p2, p2, [B

    array-length p3, v1

    invoke-static {v1, v3, p2, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length p3, v1

    array-length v0, p1

    invoke-static {p1, v3, p2, p3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length p1, p2

    new-array p1, p1, [B

    array-length p3, p2

    invoke-static {p2, v3, p1, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length p3, p2

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    move-result v0

    div-int/2addr p3, v0

    array-length p2, p2

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    move-result v0

    rem-int/2addr p2, v0

    if-nez p2, :cond_5

    iget-object p2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->paramPlusIV:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    invoke-virtual {p2, v2, v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    const/4 p2, 0x0

    :goto_1
    if-ge p2, p3, :cond_2

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    move-result v0

    mul-int v0, v0, p2

    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v1, p1, v0, p1, v0}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_2
    iget-object p2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->iv:[B

    array-length v0, p2

    array-length v1, p1

    add-int/2addr v0, v1

    new-array v0, v0, [B

    array-length v1, p2

    invoke-static {p2, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object p2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->iv:[B

    array-length p2, p2

    array-length v1, p1

    invoke-static {p1, v3, v0, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length p1, v0

    new-array p1, p1, [B

    const/4 p2, 0x0

    :goto_2
    array-length v1, v0

    if-ge p2, v1, :cond_3

    array-length v1, v0

    add-int/lit8 v4, p2, 0x1

    sub-int/2addr v1, v4

    aget-byte v1, v0, v1

    aput-byte v1, p1, p2

    move p2, v4

    goto :goto_2

    :cond_3
    new-instance p2, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->param:Lorg/bouncycastle/crypto/CipherParameters;

    sget-object v1, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->IV2:[B

    invoke-direct {p2, v0, v1}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v0, v2, p2}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    :goto_3
    add-int/lit8 p2, p3, 0x1

    if-ge v3, p2, :cond_4

    iget-object p2, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {p2}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    move-result p2

    mul-int p2, p2, v3

    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/RC2WrapEngine;->engine:Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {v0, p1, p2, p1, p2}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_4
    return-object p1

    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Not multiple of block length"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Not initialized for wrapping"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw p1

    :goto_5
    goto :goto_4
.end method
