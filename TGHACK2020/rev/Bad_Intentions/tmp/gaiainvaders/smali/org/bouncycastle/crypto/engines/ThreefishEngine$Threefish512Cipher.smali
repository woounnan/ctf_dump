.class final Lorg/bouncycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;
.super Lorg/bouncycastle/crypto/engines/ThreefishEngine$ThreefishCipher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bouncycastle/crypto/engines/ThreefishEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Threefish512Cipher"
.end annotation


# static fields
.field private static final ROTATION_0_0:I = 0x2e

.field private static final ROTATION_0_1:I = 0x24

.field private static final ROTATION_0_2:I = 0x13

.field private static final ROTATION_0_3:I = 0x25

.field private static final ROTATION_1_0:I = 0x21

.field private static final ROTATION_1_1:I = 0x1b

.field private static final ROTATION_1_2:I = 0xe

.field private static final ROTATION_1_3:I = 0x2a

.field private static final ROTATION_2_0:I = 0x11

.field private static final ROTATION_2_1:I = 0x31

.field private static final ROTATION_2_2:I = 0x24

.field private static final ROTATION_2_3:I = 0x27

.field private static final ROTATION_3_0:I = 0x2c

.field private static final ROTATION_3_1:I = 0x9

.field private static final ROTATION_3_2:I = 0x36

.field private static final ROTATION_3_3:I = 0x38

.field private static final ROTATION_4_0:I = 0x27

.field private static final ROTATION_4_1:I = 0x1e

.field private static final ROTATION_4_2:I = 0x22

.field private static final ROTATION_4_3:I = 0x18

.field private static final ROTATION_5_0:I = 0xd

.field private static final ROTATION_5_1:I = 0x32

.field private static final ROTATION_5_2:I = 0xa

.field private static final ROTATION_5_3:I = 0x11

.field private static final ROTATION_6_0:I = 0x19

.field private static final ROTATION_6_1:I = 0x1d

.field private static final ROTATION_6_2:I = 0x27

.field private static final ROTATION_6_3:I = 0x2b

.field private static final ROTATION_7_0:I = 0x8

.field private static final ROTATION_7_1:I = 0x23

.field private static final ROTATION_7_2:I = 0x38

.field private static final ROTATION_7_3:I = 0x16


# direct methods
.method protected constructor <init>([J[J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lorg/bouncycastle/crypto/engines/ThreefishEngine$ThreefishCipher;-><init>([J[J)V

    return-void
.end method


# virtual methods
.method public decryptBlock([J[J)V
    .locals 49

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/bouncycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;->kw:[J

    iget-object v2, v0, Lorg/bouncycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;->t:[J

    invoke-static {}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->access$200()[I

    move-result-object v3

    invoke-static {}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->access$100()[I

    move-result-object v4

    array-length v5, v1

    const/16 v6, 0x11

    if-ne v5, v6, :cond_2

    array-length v5, v2

    const/4 v7, 0x5

    if-ne v5, v7, :cond_1

    const/4 v5, 0x0

    aget-wide v8, p1, v5

    const/4 v10, 0x1

    aget-wide v11, p1, v10

    const/4 v13, 0x2

    aget-wide v14, p1, v13

    const/16 v16, 0x3

    aget-wide v17, p1, v16

    const/16 v19, 0x4

    aget-wide v20, p1, v19

    aget-wide v22, p1, v7

    const/16 v24, 0x6

    aget-wide v25, p1, v24

    const/16 v27, 0x7

    aget-wide v28, p1, v27

    move-wide/from16 v30, v28

    move-wide/from16 v28, v25

    move-wide/from16 v25, v22

    move-wide/from16 v22, v20

    move-wide/from16 v20, v17

    move-wide/from16 v17, v14

    move-wide v14, v11

    move-wide v11, v8

    const/16 v8, 0x11

    :goto_0
    if-lt v8, v10, :cond_0

    aget v9, v3, v8

    aget v32, v4, v8

    add-int/lit8 v33, v9, 0x1

    aget-wide v34, v1, v33

    sub-long v11, v11, v34

    add-int/lit8 v34, v9, 0x2

    aget-wide v35, v1, v34

    sub-long v14, v14, v35

    add-int/lit8 v35, v9, 0x3

    aget-wide v36, v1, v35

    sub-long v5, v17, v36

    add-int/lit8 v17, v9, 0x4

    aget-wide v36, v1, v17

    move-wide/from16 v38, v11

    sub-long v10, v20, v36

    add-int/lit8 v12, v9, 0x5

    aget-wide v20, v1, v12

    move-wide/from16 v40, v14

    sub-long v13, v22, v20

    add-int/lit8 v15, v9, 0x6

    aget-wide v20, v1, v15

    add-int/lit8 v18, v32, 0x1

    aget-wide v22, v2, v18

    add-long v20, v20, v22

    move/from16 p1, v8

    sub-long v7, v25, v20

    add-int/lit8 v20, v9, 0x7

    aget-wide v21, v1, v20

    add-int/lit8 v23, v32, 0x2

    aget-wide v25, v2, v23

    add-long v21, v21, v25

    move-object/from16 v42, v3

    move-object/from16 v43, v4

    sub-long v3, v28, v21

    add-int/lit8 v21, v9, 0x8

    aget-wide v21, v1, v21

    move/from16 v0, p1

    move-object/from16 v44, v1

    move-object/from16 v45, v2

    int-to-long v1, v0

    add-long v21, v21, v1

    const-wide/16 v25, 0x1

    add-long v21, v21, v25

    move-wide/from16 v25, v1

    sub-long v0, v30, v21

    const/16 v2, 0x8

    move/from16 v46, v9

    move-wide/from16 v47, v10

    move-wide/from16 v9, v40

    invoke-static {v9, v10, v2, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v9

    sub-long/2addr v3, v9

    const/16 v2, 0x23

    move/from16 v21, v12

    move-wide/from16 v11, v38

    invoke-static {v0, v1, v2, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v0

    sub-long/2addr v11, v0

    const/16 v2, 0x38

    invoke-static {v7, v8, v2, v5, v6}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    sub-long/2addr v5, v7

    const/16 v2, 0x16

    move-wide/from16 v28, v0

    move-wide/from16 v0, v47

    invoke-static {v0, v1, v2, v13, v14}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v0

    sub-long/2addr v13, v0

    const/16 v2, 0x19

    invoke-static {v9, v10, v2, v13, v14}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v9

    sub-long/2addr v13, v9

    const/16 v2, 0x1d

    invoke-static {v0, v1, v2, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v0

    sub-long/2addr v3, v0

    const/16 v2, 0x27

    invoke-static {v7, v8, v2, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    sub-long/2addr v11, v7

    const/16 v2, 0x2b

    move-wide/from16 v30, v0

    move-wide/from16 v0, v28

    invoke-static {v0, v1, v2, v5, v6}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v0

    sub-long/2addr v5, v0

    const/16 v2, 0xd

    invoke-static {v9, v10, v2, v5, v6}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v9

    sub-long/2addr v5, v9

    const/16 v2, 0x32

    invoke-static {v0, v1, v2, v13, v14}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v0

    sub-long/2addr v13, v0

    const/16 v2, 0xa

    invoke-static {v7, v8, v2, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    sub-long/2addr v3, v7

    move-wide/from16 v28, v0

    move-wide/from16 v0, v30

    const/16 v2, 0x11

    invoke-static {v0, v1, v2, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v0

    sub-long/2addr v11, v0

    const/16 v2, 0x27

    invoke-static {v9, v10, v2, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v9

    sub-long/2addr v11, v9

    const/16 v2, 0x1e

    invoke-static {v0, v1, v2, v5, v6}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v0

    sub-long/2addr v5, v0

    const/16 v2, 0x22

    invoke-static {v7, v8, v2, v13, v14}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    sub-long/2addr v13, v7

    const/16 v2, 0x18

    move-wide/from16 v30, v7

    move-wide/from16 v7, v28

    invoke-static {v7, v8, v2, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    sub-long/2addr v3, v7

    aget-wide v28, v44, v46

    sub-long v11, v11, v28

    aget-wide v28, v44, v33

    sub-long v9, v9, v28

    aget-wide v28, v44, v34

    sub-long v5, v5, v28

    aget-wide v28, v44, v35

    sub-long v0, v0, v28

    aget-wide v28, v44, v17

    sub-long v13, v13, v28

    aget-wide v28, v44, v21

    aget-wide v32, v45, v32

    add-long v28, v28, v32

    move-wide/from16 v32, v0

    sub-long v0, v30, v28

    aget-wide v28, v44, v15

    aget-wide v17, v45, v18

    add-long v28, v28, v17

    sub-long v3, v3, v28

    aget-wide v17, v44, v20

    add-long v17, v17, v25

    sub-long v7, v7, v17

    const/16 v2, 0x2c

    invoke-static {v9, v10, v2, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v9

    sub-long/2addr v3, v9

    const/16 v2, 0x9

    invoke-static {v7, v8, v2, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    sub-long/2addr v11, v7

    const/16 v2, 0x36

    invoke-static {v0, v1, v2, v5, v6}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v0

    sub-long/2addr v5, v0

    move-wide/from16 v17, v5

    move-wide/from16 v5, v32

    const/16 v2, 0x38

    invoke-static {v5, v6, v2, v13, v14}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v5

    sub-long/2addr v13, v5

    const/16 v2, 0x11

    invoke-static {v9, v10, v2, v13, v14}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v9

    sub-long/2addr v13, v9

    const/16 v15, 0x31

    invoke-static {v5, v6, v15, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v5

    sub-long/2addr v3, v5

    const/16 v15, 0x24

    invoke-static {v0, v1, v15, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v0

    sub-long/2addr v11, v0

    move-wide/from16 v20, v3

    move-wide/from16 v2, v17

    const/16 v4, 0x27

    invoke-static {v7, v8, v4, v2, v3}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    sub-long/2addr v2, v7

    const/16 v4, 0x21

    invoke-static {v9, v10, v4, v2, v3}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v9

    sub-long/2addr v2, v9

    const/16 v4, 0x1b

    invoke-static {v7, v8, v4, v13, v14}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    sub-long/2addr v13, v7

    const/16 v4, 0xe

    move-wide/from16 v17, v7

    move-wide/from16 v7, v20

    invoke-static {v0, v1, v4, v7, v8}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v0

    sub-long/2addr v7, v0

    const/16 v4, 0x2a

    invoke-static {v5, v6, v4, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v4

    sub-long/2addr v11, v4

    const/16 v6, 0x2e

    invoke-static {v9, v10, v6, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v9

    sub-long/2addr v11, v9

    invoke-static {v4, v5, v15, v2, v3}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v20

    sub-long v2, v2, v20

    const/16 v4, 0x13

    invoke-static {v0, v1, v4, v13, v14}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v25

    sub-long v22, v13, v25

    const/16 v0, 0x25

    move-wide/from16 v4, v17

    invoke-static {v4, v5, v0, v7, v8}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v30

    sub-long v28, v7, v30

    add-int/lit8 v8, p1, -0x2

    move-object/from16 v0, p0

    move-wide/from16 v17, v2

    move-wide v14, v9

    move-object/from16 v3, v42

    move-object/from16 v4, v43

    move-object/from16 v1, v44

    move-object/from16 v2, v45

    const/4 v5, 0x0

    const/16 v6, 0x11

    const/4 v7, 0x5

    const/4 v10, 0x1

    const/4 v13, 0x2

    goto/16 :goto_0

    :cond_0
    move-object/from16 v44, v1

    move-object/from16 v45, v2

    const/4 v0, 0x0

    aget-wide v1, v44, v0

    sub-long/2addr v11, v1

    const/4 v1, 0x1

    aget-wide v2, v44, v1

    sub-long/2addr v14, v2

    const/4 v1, 0x2

    aget-wide v2, v44, v1

    sub-long v17, v17, v2

    aget-wide v1, v44, v16

    sub-long v20, v20, v1

    aget-wide v1, v44, v19

    sub-long v22, v22, v1

    const/4 v1, 0x5

    aget-wide v2, v44, v1

    aget-wide v4, v45, v0

    add-long/2addr v2, v4

    sub-long v25, v25, v2

    aget-wide v1, v44, v24

    const/4 v3, 0x1

    aget-wide v4, v45, v3

    add-long/2addr v1, v4

    sub-long v28, v28, v1

    aget-wide v1, v44, v27

    sub-long v30, v30, v1

    aput-wide v11, p2, v0

    aput-wide v14, p2, v3

    const/4 v0, 0x2

    aput-wide v17, p2, v0

    aput-wide v20, p2, v16

    aput-wide v22, p2, v19

    const/4 v0, 0x5

    aput-wide v25, p2, v0

    aput-wide v28, p2, v24

    aput-wide v30, p2, v27

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public encryptBlock([J[J)V
    .locals 50

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/bouncycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;->kw:[J

    iget-object v2, v0, Lorg/bouncycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;->t:[J

    invoke-static {}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->access$200()[I

    move-result-object v3

    invoke-static {}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->access$100()[I

    move-result-object v4

    array-length v5, v1

    const/16 v6, 0x11

    if-ne v5, v6, :cond_2

    array-length v5, v2

    const/4 v7, 0x5

    if-ne v5, v7, :cond_1

    const/4 v5, 0x0

    aget-wide v8, p1, v5

    const/4 v10, 0x1

    aget-wide v11, p1, v10

    const/4 v13, 0x2

    aget-wide v14, p1, v13

    const/16 v16, 0x3

    aget-wide v17, p1, v16

    const/16 v19, 0x4

    aget-wide v20, p1, v19

    aget-wide v22, p1, v7

    const/16 v24, 0x6

    aget-wide v25, p1, v24

    const/16 v27, 0x7

    aget-wide v28, p1, v27

    aget-wide v30, v1, v5

    add-long v8, v8, v30

    aget-wide v30, v1, v10

    add-long v11, v11, v30

    aget-wide v30, v1, v13

    add-long v14, v14, v30

    aget-wide v30, v1, v16

    add-long v17, v17, v30

    aget-wide v30, v1, v19

    add-long v20, v20, v30

    aget-wide v30, v1, v7

    aget-wide v32, v2, v5

    add-long v30, v30, v32

    add-long v22, v22, v30

    aget-wide v30, v1, v24

    aget-wide v32, v2, v10

    add-long v30, v30, v32

    add-long v25, v25, v30

    aget-wide v30, v1, v27

    add-long v28, v28, v30

    move-wide/from16 v5, v17

    move-wide/from16 v34, v28

    move-wide/from16 v17, v14

    move-wide v14, v11

    move-wide v11, v8

    move-wide/from16 v9, v22

    const/4 v8, 0x1

    move-wide/from16 v21, v20

    :goto_0
    const/16 v7, 0x12

    if-ge v8, v7, :cond_0

    aget v7, v3, v8

    aget v29, v4, v8

    const/16 v13, 0x2e

    add-long/2addr v11, v14

    invoke-static {v14, v15, v13, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v13

    move-object/from16 v31, v3

    move-object/from16 v32, v4

    add-long v3, v17, v5

    const/16 v15, 0x24

    invoke-static {v5, v6, v15, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v5

    const/16 v15, 0x13

    move-object/from16 v33, v1

    add-long v0, v21, v9

    invoke-static {v9, v10, v15, v0, v1}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v9

    const/16 v15, 0x25

    move/from16 v37, v7

    move/from16 v36, v8

    move-wide/from16 v7, v34

    move-wide/from16 v34, v5

    add-long v5, v25, v7

    invoke-static {v7, v8, v15, v5, v6}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    const/16 v15, 0x21

    add-long/2addr v3, v13

    invoke-static {v13, v14, v15, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v13

    const/16 v15, 0x1b

    add-long/2addr v0, v7

    invoke-static {v7, v8, v15, v0, v1}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    const/16 v15, 0xe

    add-long/2addr v5, v9

    invoke-static {v9, v10, v15, v5, v6}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v9

    const/16 v15, 0x2a

    add-long v11, v11, v34

    move-wide/from16 v21, v9

    move-wide/from16 v9, v34

    invoke-static {v9, v10, v15, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v9

    add-long/2addr v0, v13

    const/16 v15, 0x11

    invoke-static {v13, v14, v15, v0, v1}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v13

    move-wide/from16 v48, v9

    move-wide/from16 v9, v21

    move-wide/from16 v21, v0

    move-wide/from16 v0, v48

    const/16 v15, 0x31

    add-long/2addr v5, v0

    invoke-static {v0, v1, v15, v5, v6}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v0

    add-long/2addr v11, v9

    const/16 v15, 0x24

    invoke-static {v9, v10, v15, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v9

    add-long/2addr v3, v7

    const/16 v15, 0x27

    invoke-static {v7, v8, v15, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    const/16 v15, 0x2c

    add-long/2addr v5, v13

    invoke-static {v13, v14, v15, v5, v6}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v13

    const/16 v15, 0x9

    add-long/2addr v11, v7

    invoke-static {v7, v8, v15, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    const/16 v15, 0x36

    add-long/2addr v3, v9

    invoke-static {v9, v10, v15, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v9

    move-wide/from16 v25, v7

    add-long v7, v21, v0

    const/16 v15, 0x38

    invoke-static {v0, v1, v15, v7, v8}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v0

    aget-wide v21, v33, v37

    add-long v11, v11, v21

    add-int/lit8 v18, v37, 0x1

    aget-wide v21, v33, v18

    add-long v13, v13, v21

    add-int/lit8 v21, v37, 0x2

    aget-wide v34, v33, v21

    add-long v3, v3, v34

    add-int/lit8 v22, v37, 0x3

    aget-wide v34, v33, v22

    add-long v0, v0, v34

    add-int/lit8 v34, v37, 0x4

    aget-wide v38, v33, v34

    add-long v7, v7, v38

    add-int/lit8 v35, v37, 0x5

    aget-wide v38, v33, v35

    aget-wide v40, v2, v29

    add-long v38, v38, v40

    add-long v9, v9, v38

    add-int/lit8 v38, v37, 0x6

    aget-wide v39, v33, v38

    add-int/lit8 v41, v29, 0x1

    aget-wide v42, v2, v41

    add-long v39, v39, v42

    add-long v5, v5, v39

    add-int/lit8 v39, v37, 0x7

    aget-wide v42, v33, v39

    move-wide/from16 v44, v5

    move/from16 v15, v36

    int-to-long v5, v15

    add-long v42, v42, v5

    move-wide/from16 v46, v5

    add-long v5, v25, v42

    add-long/2addr v11, v13

    const/16 v15, 0x27

    invoke-static {v13, v14, v15, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v13

    const/16 v15, 0x1e

    add-long/2addr v3, v0

    invoke-static {v0, v1, v15, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v0

    const/16 v15, 0x22

    add-long/2addr v7, v9

    invoke-static {v9, v10, v15, v7, v8}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v9

    const/16 v15, 0x18

    move-wide/from16 v25, v0

    add-long v0, v44, v5

    invoke-static {v5, v6, v15, v0, v1}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v5

    const/16 v15, 0xd

    add-long/2addr v3, v13

    invoke-static {v13, v14, v15, v3, v4}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v13

    const/16 v15, 0x32

    add-long/2addr v7, v5

    invoke-static {v5, v6, v15, v7, v8}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v5

    const/16 v15, 0xa

    add-long/2addr v0, v9

    invoke-static {v9, v10, v15, v0, v1}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v9

    add-long v11, v11, v25

    move-object/from16 v42, v2

    move-wide/from16 v43, v3

    move-wide/from16 v2, v25

    const/16 v4, 0x11

    invoke-static {v2, v3, v4, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v2

    const/16 v15, 0x19

    add-long/2addr v7, v13

    invoke-static {v13, v14, v15, v7, v8}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v13

    const/16 v15, 0x1d

    add-long/2addr v0, v2

    invoke-static {v2, v3, v15, v0, v1}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v2

    add-long/2addr v11, v9

    const/16 v15, 0x27

    invoke-static {v9, v10, v15, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v9

    const/16 v15, 0x2b

    move-wide/from16 v25, v2

    add-long v2, v43, v5

    invoke-static {v5, v6, v15, v2, v3}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v5

    add-long/2addr v0, v13

    const/16 v15, 0x8

    invoke-static {v13, v14, v15, v0, v1}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v13

    const/16 v4, 0x23

    add-long/2addr v11, v5

    invoke-static {v5, v6, v4, v11, v12}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v4

    add-long/2addr v2, v9

    const/16 v6, 0x38

    invoke-static {v9, v10, v6, v2, v3}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v9

    const/16 v6, 0x16

    add-long v7, v7, v25

    move-wide/from16 v43, v4

    move-wide/from16 v4, v25

    invoke-static {v4, v5, v6, v7, v8}, Lorg/bouncycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v4

    aget-wide v17, v33, v18

    add-long v11, v11, v17

    aget-wide v17, v33, v21

    add-long v13, v13, v17

    aget-wide v17, v33, v22

    add-long v17, v2, v17

    aget-wide v2, v33, v34

    add-long/2addr v2, v4

    aget-wide v4, v33, v35

    add-long v21, v7, v4

    aget-wide v4, v33, v38

    aget-wide v6, v42, v41

    add-long/2addr v4, v6

    add-long/2addr v9, v4

    aget-wide v4, v33, v39

    const/4 v6, 0x2

    add-int/lit8 v29, v29, 0x2

    aget-wide v6, v42, v29

    add-long/2addr v4, v6

    add-long v25, v0, v4

    add-int/lit8 v7, v37, 0x8

    aget-wide v0, v33, v7

    add-long v0, v0, v46

    const-wide/16 v4, 0x1

    add-long/2addr v0, v4

    add-long v34, v43, v0

    add-int/lit8 v8, v36, 0x2

    move-object/from16 v0, p0

    move-wide v5, v2

    move-wide v14, v13

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v42

    const/4 v13, 0x2

    goto/16 :goto_0

    :cond_0
    move-wide/from16 v7, v34

    const/4 v0, 0x0

    aput-wide v11, p2, v0

    const/4 v0, 0x1

    aput-wide v14, p2, v0

    const/4 v0, 0x2

    aput-wide v17, p2, v0

    aput-wide v5, p2, v16

    aput-wide v21, p2, v19

    const/4 v0, 0x5

    aput-wide v9, p2, v0

    aput-wide v25, p2, v24

    aput-wide v7, p2, v27

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method
