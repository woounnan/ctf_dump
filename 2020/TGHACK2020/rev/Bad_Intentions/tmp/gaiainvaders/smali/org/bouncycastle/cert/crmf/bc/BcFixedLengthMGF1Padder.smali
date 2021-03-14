.class public Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/bouncycastle/cert/crmf/EncryptedValuePadder;


# instance fields
.field private dig:Lorg/bouncycastle/crypto/Digest;

.field private length:I

.field private random:Ljava/security/SecureRandom;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;-><init>(ILjava/security/SecureRandom;)V

    return-void
.end method

.method public constructor <init>(ILjava/security/SecureRandom;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/bouncycastle/crypto/digests/SHA1Digest;

    invoke-direct {v0}, Lorg/bouncycastle/crypto/digests/SHA1Digest;-><init>()V

    iput-object v0, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->dig:Lorg/bouncycastle/crypto/Digest;

    iput p1, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->length:I

    iput-object p2, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->random:Ljava/security/SecureRandom;

    return-void
.end method


# virtual methods
.method public getPaddedData([B)[B
    .locals 6

    iget v0, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->length:I

    new-array v0, v0, [B

    iget-object v1, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->dig:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v1}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v1

    new-array v1, v1, [B

    iget v2, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->length:I

    iget-object v3, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->dig:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v3}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v3

    sub-int/2addr v2, v3

    new-array v2, v2, [B

    iget-object v3, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->random:Ljava/security/SecureRandom;

    if-nez v3, :cond_0

    new-instance v3, Ljava/security/SecureRandom;

    invoke-direct {v3}, Ljava/security/SecureRandom;-><init>()V

    iput-object v3, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->random:Ljava/security/SecureRandom;

    :cond_0
    iget-object v3, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->random:Ljava/security/SecureRandom;

    invoke-virtual {v3, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    new-instance v3, Lorg/bouncycastle/crypto/generators/MGF1BytesGenerator;

    iget-object v4, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->dig:Lorg/bouncycastle/crypto/Digest;

    invoke-direct {v3, v4}, Lorg/bouncycastle/crypto/generators/MGF1BytesGenerator;-><init>(Lorg/bouncycastle/crypto/Digest;)V

    new-instance v4, Lorg/bouncycastle/crypto/params/MGFParameters;

    invoke-direct {v4, v1}, Lorg/bouncycastle/crypto/params/MGFParameters;-><init>([B)V

    invoke-virtual {v3, v4}, Lorg/bouncycastle/crypto/generators/MGF1BytesGenerator;->init(Lorg/bouncycastle/crypto/DerivationParameters;)V

    array-length v4, v2

    const/4 v5, 0x0

    invoke-virtual {v3, v2, v5, v4}, Lorg/bouncycastle/crypto/generators/MGF1BytesGenerator;->generateBytes([BII)I

    array-length v3, v1

    invoke-static {v1, v5, v0, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v3, v1

    array-length v4, p1

    invoke-static {p1, v5, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v3, v1

    array-length p1, p1

    add-int/2addr v3, p1

    :goto_0
    add-int/lit8 v3, v3, 0x1

    array-length p1, v0

    if-eq v3, p1, :cond_1

    iget-object p1, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->random:Ljava/security/SecureRandom;

    const/16 v4, 0xff

    invoke-virtual {p1, v4}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    int-to-byte p1, p1

    aput-byte p1, v0, v3

    goto :goto_0

    :cond_1
    :goto_1
    array-length p1, v2

    if-eq v5, p1, :cond_2

    array-length p1, v1

    add-int/2addr p1, v5

    aget-byte v3, v0, p1

    aget-byte v4, v2, v5

    xor-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v0, p1

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    return-object v0
.end method

.method public getUnpaddedData([B)[B
    .locals 7

    iget-object v0, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->dig:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v0}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v0

    new-array v0, v0, [B

    iget v1, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->length:I

    iget-object v2, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->dig:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v2}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v2

    sub-int/2addr v1, v2

    new-array v1, v1, [B

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {p1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    new-instance v2, Lorg/bouncycastle/crypto/generators/MGF1BytesGenerator;

    iget-object v4, p0, Lorg/bouncycastle/cert/crmf/bc/BcFixedLengthMGF1Padder;->dig:Lorg/bouncycastle/crypto/Digest;

    invoke-direct {v2, v4}, Lorg/bouncycastle/crypto/generators/MGF1BytesGenerator;-><init>(Lorg/bouncycastle/crypto/Digest;)V

    new-instance v4, Lorg/bouncycastle/crypto/params/MGFParameters;

    invoke-direct {v4, v0}, Lorg/bouncycastle/crypto/params/MGFParameters;-><init>([B)V

    invoke-virtual {v2, v4}, Lorg/bouncycastle/crypto/generators/MGF1BytesGenerator;->init(Lorg/bouncycastle/crypto/DerivationParameters;)V

    array-length v4, v1

    invoke-virtual {v2, v1, v3, v4}, Lorg/bouncycastle/crypto/generators/MGF1BytesGenerator;->generateBytes([BII)I

    const/4 v2, 0x0

    :goto_0
    array-length v4, v1

    if-eq v2, v4, :cond_0

    array-length v4, v0

    add-int/2addr v4, v2

    aget-byte v5, p1, v4

    aget-byte v6, v1, v2

    xor-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, p1, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    :goto_1
    array-length v2, v0

    if-eq v1, v2, :cond_2

    aget-byte v2, p1, v1

    if-nez v2, :cond_1

    goto :goto_2

    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_2
    if-eqz v1, :cond_3

    array-length v2, v0

    sub-int/2addr v1, v2

    new-array v1, v1, [B

    array-length v0, v0

    array-length v2, v1

    invoke-static {p1, v0, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "bad padding in encoding"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method
