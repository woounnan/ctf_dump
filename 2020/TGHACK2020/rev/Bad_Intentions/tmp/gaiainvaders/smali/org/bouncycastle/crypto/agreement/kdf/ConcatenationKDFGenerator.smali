.class public Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/bouncycastle/crypto/DerivationFunction;


# instance fields
.field private digest:Lorg/bouncycastle/crypto/Digest;

.field private hLen:I

.field private otherInfo:[B

.field private shared:[B


# direct methods
.method public constructor <init>(Lorg/bouncycastle/crypto/Digest;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {p1}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result p1

    iput p1, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    return-void
.end method

.method private ItoOSP(I[B)V
    .locals 3

    ushr-int/lit8 v0, p1, 0x18

    int-to-byte v0, v0

    const/4 v1, 0x0

    aput-byte v0, p2, v1

    ushr-int/lit8 v0, p1, 0x10

    int-to-byte v0, v0

    const/4 v2, 0x1

    aput-byte v0, p2, v2

    ushr-int/lit8 v0, p1, 0x8

    int-to-byte v0, v0

    const/4 v2, 0x2

    aput-byte v0, p2, v2

    ushr-int/2addr p1, v1

    int-to-byte p1, p1

    const/4 v0, 0x3

    aput-byte p1, p2, v0

    return-void
.end method


# virtual methods
.method public generateBytes([BII)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/bouncycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    array-length v0, p1

    sub-int/2addr v0, p3

    if-lt v0, p2, :cond_3

    iget v0, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    new-array v0, v0, [B

    const/4 v1, 0x4

    new-array v1, v1, [B

    iget-object v2, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v2}, Lorg/bouncycastle/crypto/Digest;->reset()V

    iget v2, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-le p3, v2, :cond_1

    const/4 v2, 0x0

    :goto_0
    invoke-direct {p0, v3, v1}, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->ItoOSP(I[B)V

    iget-object v5, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    array-length v6, v1

    invoke-interface {v5, v1, v4, v6}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v5, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    iget-object v6, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->shared:[B

    array-length v7, v6

    invoke-interface {v5, v6, v4, v7}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v5, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    iget-object v6, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->otherInfo:[B

    array-length v7, v6

    invoke-interface {v5, v6, v4, v7}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v5, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v5, v0, v4}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    add-int v5, p2, v2

    iget v6, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    invoke-static {v0, v4, p1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v5, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->hLen:I

    add-int/2addr v2, v5

    add-int/lit8 v6, v3, 0x1

    div-int v5, p3, v5

    if-lt v3, v5, :cond_0

    move v3, v6

    goto :goto_1

    :cond_0
    move v3, v6

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_1
    if-ge v2, p3, :cond_2

    invoke-direct {p0, v3, v1}, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->ItoOSP(I[B)V

    iget-object v3, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    array-length v5, v1

    invoke-interface {v3, v1, v4, v5}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v1, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    iget-object v3, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->shared:[B

    array-length v5, v3

    invoke-interface {v1, v3, v4, v5}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v1, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    iget-object v3, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->otherInfo:[B

    array-length v5, v3

    invoke-interface {v1, v3, v4, v5}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v1, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v1, v0, v4}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    add-int/2addr p2, v2

    sub-int v1, p3, v2

    invoke-static {v0, v4, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_2
    return p3

    :cond_3
    new-instance p1, Lorg/bouncycastle/crypto/OutputLengthException;

    const-string p2, "output buffer too small"

    invoke-direct {p1, p2}, Lorg/bouncycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public getDigest()Lorg/bouncycastle/crypto/Digest;
    .locals 1

    iget-object v0, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->digest:Lorg/bouncycastle/crypto/Digest;

    return-object v0
.end method

.method public init(Lorg/bouncycastle/crypto/DerivationParameters;)V
    .locals 1

    instance-of v0, p1, Lorg/bouncycastle/crypto/params/KDFParameters;

    if-eqz v0, :cond_0

    check-cast p1, Lorg/bouncycastle/crypto/params/KDFParameters;

    invoke-virtual {p1}, Lorg/bouncycastle/crypto/params/KDFParameters;->getSharedSecret()[B

    move-result-object v0

    iput-object v0, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->shared:[B

    invoke-virtual {p1}, Lorg/bouncycastle/crypto/params/KDFParameters;->getIV()[B

    move-result-object p1

    iput-object p1, p0, Lorg/bouncycastle/crypto/agreement/kdf/ConcatenationKDFGenerator;->otherInfo:[B

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "KDF parameters required for generator"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
