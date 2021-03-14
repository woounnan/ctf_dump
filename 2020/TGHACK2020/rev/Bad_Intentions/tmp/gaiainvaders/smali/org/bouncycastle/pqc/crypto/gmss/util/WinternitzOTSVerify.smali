.class public Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;
.super Ljava/lang/Object;


# instance fields
.field private messDigestOTS:Lorg/bouncycastle/crypto/Digest;

.field private w:I


# direct methods
.method public constructor <init>(Lorg/bouncycastle/crypto/Digest;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    iput-object p1, p0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    return-void
.end method


# virtual methods
.method public Verify([B[B)[B
    .locals 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v3}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v3

    new-array v4, v3, [B

    iget-object v4, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    array-length v5, v1

    const/4 v6, 0x0

    invoke-interface {v4, v1, v6, v5}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v1, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v1}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v1

    new-array v1, v1, [B

    iget-object v4, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v4, v1, v6}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    shl-int/lit8 v4, v3, 0x3

    iget v5, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    add-int/lit8 v7, v5, -0x1

    add-int/2addr v7, v4

    div-int/2addr v7, v5

    shl-int v5, v7, v5

    const/4 v8, 0x1

    add-int/2addr v5, v8

    invoke-virtual {v0, v5}, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->getLog(I)I

    move-result v5

    iget v9, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    add-int v10, v5, v9

    sub-int/2addr v10, v8

    div-int/2addr v10, v9

    add-int/2addr v10, v7

    mul-int v10, v10, v3

    array-length v11, v2

    if-eq v10, v11, :cond_0

    const/4 v1, 0x0

    return-object v1

    :cond_0
    new-array v10, v10, [B

    const/16 v11, 0x8

    rem-int v12, v11, v9

    if-nez v12, :cond_5

    div-int/2addr v11, v9

    shl-int v4, v8, v9

    sub-int/2addr v4, v8

    new-array v8, v3, [B

    move-object v13, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v12, 0x0

    :goto_0
    array-length v14, v1

    if-ge v8, v14, :cond_3

    move-object v14, v13

    move v13, v12

    move v12, v9

    const/4 v9, 0x0

    :goto_1
    if-ge v9, v11, :cond_2

    aget-byte v15, v1, v8

    and-int/2addr v15, v4

    add-int/2addr v12, v15

    move/from16 p1, v11

    mul-int v11, v13, v3

    invoke-static {v2, v11, v14, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_2
    move/from16 v16, v12

    if-ge v15, v4, :cond_1

    iget-object v12, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    array-length v2, v14

    invoke-interface {v12, v14, v6, v2}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v2, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v2}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v2

    new-array v14, v2, [B

    iget-object v2, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v2, v14, v6}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v2, p2

    move/from16 v12, v16

    goto :goto_2

    :cond_1
    invoke-static {v14, v6, v10, v11, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aget-byte v2, v1, v8

    iget v11, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    ushr-int/2addr v2, v11

    int-to-byte v2, v2

    aput-byte v2, v1, v8

    add-int/lit8 v13, v13, 0x1

    add-int/lit8 v9, v9, 0x1

    move/from16 v11, p1

    move-object/from16 v2, p2

    goto :goto_1

    :cond_2
    move/from16 p1, v11

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v2, p2

    move v9, v12

    move v12, v13

    move-object v13, v14

    goto :goto_0

    :cond_3
    iget v1, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    shl-int v1, v7, v1

    sub-int/2addr v1, v9

    move v2, v1

    const/4 v1, 0x0

    :goto_3
    if-ge v1, v5, :cond_16

    and-int v7, v2, v4

    mul-int v8, v12, v3

    move-object/from16 v14, p2

    invoke-static {v14, v8, v13, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_4
    if-ge v7, v4, :cond_4

    iget-object v9, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    array-length v11, v13

    invoke-interface {v9, v13, v6, v11}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v9, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v9}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v9

    new-array v13, v9, [B

    iget-object v9, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v9, v13, v6}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    :cond_4
    invoke-static {v13, v6, v10, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v7, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    ushr-int/2addr v2, v7

    add-int/lit8 v12, v12, 0x1

    add-int/2addr v1, v7

    goto :goto_3

    :cond_5
    move-object v14, v2

    if-ge v9, v11, :cond_e

    div-int v2, v3, v9

    shl-int v4, v8, v9

    sub-int/2addr v4, v8

    new-array v9, v3, [B

    move-object/from16 v18, v9

    const/4 v9, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    :goto_5
    if-ge v9, v2, :cond_9

    move/from16 v21, v15

    const/4 v15, 0x0

    const-wide/16 v19, 0x0

    :goto_6
    iget v12, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    if-ge v15, v12, :cond_6

    aget-byte v12, v1, v21

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v13, v15, 0x3

    shl-int/2addr v12, v13

    int-to-long v12, v12

    xor-long v19, v19, v12

    add-int/lit8 v21, v21, 0x1

    add-int/lit8 v15, v15, 0x1

    goto :goto_6

    :cond_6
    move-object/from16 v13, v18

    const/4 v12, 0x0

    :goto_7
    move/from16 v24, v9

    if-ge v12, v11, :cond_8

    int-to-long v8, v4

    and-long v8, v19, v8

    long-to-int v9, v8

    add-int v16, v16, v9

    mul-int v8, v17, v3

    invoke-static {v14, v8, v13, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_8
    if-ge v9, v4, :cond_7

    iget-object v15, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    array-length v11, v13

    invoke-interface {v15, v13, v6, v11}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v11, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v11}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v11

    new-array v13, v11, [B

    iget-object v11, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v11, v13, v6}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    add-int/lit8 v9, v9, 0x1

    const/16 v11, 0x8

    goto :goto_8

    :cond_7
    invoke-static {v13, v6, v10, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v8, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    ushr-long v19, v19, v8

    add-int/lit8 v17, v17, 0x1

    add-int/lit8 v12, v12, 0x1

    move/from16 v9, v24

    const/4 v8, 0x1

    const/16 v11, 0x8

    goto :goto_7

    :cond_8
    add-int/lit8 v9, v24, 0x1

    move-object/from16 v18, v13

    move/from16 v15, v21

    const/4 v8, 0x1

    const/16 v11, 0x8

    goto :goto_5

    :cond_9
    iget v2, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    rem-int v2, v3, v2

    const/4 v8, 0x0

    const-wide/16 v22, 0x0

    :goto_9
    if-ge v8, v2, :cond_a

    aget-byte v9, v1, v15

    and-int/lit16 v9, v9, 0xff

    shl-int/lit8 v11, v8, 0x3

    shl-int/2addr v9, v11

    int-to-long v11, v9

    xor-long v22, v22, v11

    const/4 v9, 0x1

    add-int/2addr v15, v9

    add-int/lit8 v8, v8, 0x1

    goto :goto_9

    :cond_a
    shl-int/lit8 v1, v2, 0x3

    move-object/from16 v8, v18

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v1, :cond_c

    int-to-long v11, v4

    and-long v11, v22, v11

    long-to-int v9, v11

    add-int v16, v16, v9

    mul-int v11, v17, v3

    invoke-static {v14, v11, v8, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_b
    if-ge v9, v4, :cond_b

    iget-object v12, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    array-length v13, v8

    invoke-interface {v12, v8, v6, v13}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v8, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v8}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v8

    new-array v8, v8, [B

    iget-object v12, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v12, v8, v6}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    add-int/lit8 v9, v9, 0x1

    goto :goto_b

    :cond_b
    invoke-static {v8, v6, v10, v11, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v9, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    ushr-long v22, v22, v9

    add-int/lit8 v17, v17, 0x1

    add-int/2addr v2, v9

    goto :goto_a

    :cond_c
    iget v1, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    shl-int v1, v7, v1

    sub-int v1, v1, v16

    move v2, v1

    const/4 v1, 0x0

    :goto_c
    if-ge v1, v5, :cond_16

    and-int v7, v2, v4

    mul-int v9, v17, v3

    invoke-static {v14, v9, v8, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_d
    if-ge v7, v4, :cond_d

    iget-object v11, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    array-length v12, v8

    invoke-interface {v11, v8, v6, v12}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v8, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v8}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v8

    new-array v8, v8, [B

    iget-object v11, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v11, v8, v6}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    add-int/lit8 v7, v7, 0x1

    goto :goto_d

    :cond_d
    invoke-static {v8, v6, v10, v9, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v7, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    ushr-int/2addr v2, v7

    add-int/lit8 v17, v17, 0x1

    add-int/2addr v1, v7

    goto :goto_c

    :cond_e
    const/16 v2, 0x39

    if-ge v9, v2, :cond_16

    sub-int/2addr v4, v9

    const/4 v2, 0x1

    shl-int v8, v2, v9

    sub-int/2addr v8, v2

    new-array v2, v3, [B

    move-object v12, v2

    const/4 v2, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    :goto_e
    if-gt v2, v4, :cond_11

    ushr-int/lit8 v13, v2, 0x3

    rem-int/lit8 v17, v2, 0x8

    iget v15, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    add-int/2addr v2, v15

    add-int/lit8 v15, v2, 0x7

    ushr-int/lit8 v15, v15, 0x3

    const/16 v16, 0x0

    const-wide/16 v20, 0x0

    :goto_f
    if-ge v13, v15, :cond_f

    aget-byte v6, v1, v13

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v25, v16, 0x3

    shl-int v6, v6, v25

    move/from16 v26, v4

    move/from16 v25, v5

    int-to-long v4, v6

    xor-long v20, v20, v4

    const/4 v4, 0x1

    add-int/lit8 v16, v16, 0x1

    add-int/lit8 v13, v13, 0x1

    move/from16 v5, v25

    move/from16 v4, v26

    const/4 v6, 0x0

    goto :goto_f

    :cond_f
    move/from16 v26, v4

    move/from16 v25, v5

    ushr-long v4, v20, v17

    move v13, v7

    int-to-long v6, v8

    and-long/2addr v4, v6

    move v15, v8

    int-to-long v8, v9

    add-long/2addr v8, v4

    long-to-int v9, v8

    mul-int v8, v11, v3

    move/from16 v16, v2

    const/4 v2, 0x0

    invoke-static {v14, v8, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_10
    cmp-long v17, v4, v6

    if-gez v17, :cond_10

    move-wide/from16 v20, v6

    iget-object v6, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    array-length v7, v12

    invoke-interface {v6, v12, v2, v7}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v6, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v6}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v6

    new-array v12, v6, [B

    iget-object v6, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v6, v12, v2}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    move-wide/from16 v6, v20

    goto :goto_10

    :cond_10
    invoke-static {v12, v2, v10, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v11, v11, 0x1

    move v7, v13

    move v8, v15

    move/from16 v2, v16

    move/from16 v5, v25

    move/from16 v4, v26

    const/4 v6, 0x0

    goto :goto_e

    :cond_11
    move/from16 v25, v5

    move v13, v7

    move v15, v8

    ushr-int/lit8 v4, v2, 0x3

    if-ge v4, v3, :cond_14

    const/16 v5, 0x8

    rem-int/2addr v2, v5

    const/4 v5, 0x0

    const-wide/16 v22, 0x0

    :goto_11
    if-ge v4, v3, :cond_12

    aget-byte v6, v1, v4

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v7, v5, 0x3

    shl-int/2addr v6, v7

    int-to-long v6, v6

    xor-long v22, v22, v6

    const/4 v6, 0x1

    add-int/2addr v5, v6

    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    :cond_12
    ushr-long v1, v22, v2

    move v8, v15

    int-to-long v4, v8

    and-long/2addr v1, v4

    int-to-long v6, v9

    add-long/2addr v6, v1

    long-to-int v9, v6

    mul-int v6, v11, v3

    const/4 v7, 0x0

    invoke-static {v14, v6, v12, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_12
    cmp-long v15, v1, v4

    if-gez v15, :cond_13

    iget-object v15, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    move-wide/from16 v16, v4

    array-length v4, v12

    invoke-interface {v15, v12, v7, v4}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v4, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v4}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v4

    new-array v12, v4, [B

    iget-object v4, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v4, v12, v7}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    const-wide/16 v4, 0x1

    add-long/2addr v1, v4

    move-wide/from16 v4, v16

    goto :goto_12

    :cond_13
    invoke-static {v12, v7, v10, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v11, v11, 0x1

    goto :goto_13

    :cond_14
    move v8, v15

    :goto_13
    iget v1, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    shl-int v1, v13, v1

    sub-int/2addr v1, v9

    move v4, v1

    move/from16 v1, v25

    const/4 v2, 0x0

    :goto_14
    if-ge v2, v1, :cond_16

    and-int v5, v4, v8

    int-to-long v5, v5

    mul-int v7, v11, v3

    const/4 v9, 0x0

    invoke-static {v14, v7, v12, v9, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v13, v10

    :goto_15
    int-to-long v9, v8

    cmp-long v15, v5, v9

    if-gez v15, :cond_15

    iget-object v9, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    array-length v10, v12

    const/4 v15, 0x0

    invoke-interface {v9, v12, v15, v10}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v9, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v9}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v9

    new-array v12, v9, [B

    iget-object v9, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v9, v12, v15}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    const-wide/16 v9, 0x1

    add-long/2addr v5, v9

    goto :goto_15

    :cond_15
    move-object v5, v13

    const-wide/16 v9, 0x1

    const/4 v15, 0x0

    invoke-static {v12, v15, v5, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v6, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    ushr-int/2addr v4, v6

    add-int/lit8 v11, v11, 0x1

    add-int/2addr v2, v6

    move-object v10, v5

    goto :goto_14

    :cond_16
    move-object v5, v10

    new-array v1, v3, [B

    iget-object v1, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    array-length v2, v5

    const/4 v3, 0x0

    invoke-interface {v1, v5, v3, v2}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    iget-object v1, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v1}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v1

    new-array v1, v1, [B

    iget-object v2, v0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v2, v1, v3}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    return-object v1
.end method

.method public getLog(I)I
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x2

    :goto_0
    if-ge v1, p1, :cond_0

    shl-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method

.method public getSignatureLength()I
    .locals 4

    iget-object v0, p0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v0}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v0

    shl-int/lit8 v1, v0, 0x3

    iget v2, p0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    add-int/lit8 v3, v2, -0x1

    add-int/2addr v1, v3

    div-int/2addr v1, v2

    shl-int v2, v1, v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v2}, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->getLog(I)I

    move-result v2

    iget v3, p0, Lorg/bouncycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x1

    div-int/2addr v2, v3

    add-int/2addr v1, v2

    mul-int v0, v0, v1

    return v0
.end method
