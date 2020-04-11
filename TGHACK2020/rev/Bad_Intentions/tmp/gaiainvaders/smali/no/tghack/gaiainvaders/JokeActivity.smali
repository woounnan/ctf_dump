.class public final Lno/tghack/gaiainvaders/JokeActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "JokeActivity.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJokeActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JokeActivity.kt\nno/tghack/gaiainvaders/JokeActivity\n*L\n1#1,90:1\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0016\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u0004J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\u000cH\u0002J\u0012\u0010\r\u001a\u00020\n2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0014J\u0010\u0010\u0010\u001a\u00020\n2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082D\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lno/tghack/gaiainvaders/JokeActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "()V",
        "ciphertext",
        "",
        "key",
        "decrypt",
        "b64key",
        "b64ciphertext",
        "decryptAnswer",
        "",
        "answer",
        "Landroid/widget/TextView;",
        "onCreate",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "showHide",
        "view",
        "Landroid/view/View;",
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
.field private _$_findViewCache:Ljava/util/HashMap;

.field private final ciphertext:Ljava/lang/String;

.field private final key:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const-string v0, "RTRvInzt/bzxdJgClIpZTftgpE2FwyjMyQMwCTnjQa0="

    .line 16
    iput-object v0, p0, Lno/tghack/gaiainvaders/JokeActivity;->ciphertext:Ljava/lang/String;

    const-string v0, "BG0I2BRlkbTPevVsWzdozg=="

    .line 17
    iput-object v0, p0, Lno/tghack/gaiainvaders/JokeActivity;->key:Ljava/lang/String;

    return-void
.end method

.method public static final synthetic access$decryptAnswer(Lno/tghack/gaiainvaders/JokeActivity;Ljava/lang/String;Landroid/widget/TextView;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lno/tghack/gaiainvaders/JokeActivity;->decryptAnswer(Ljava/lang/String;Landroid/widget/TextView;)V

    return-void
.end method

.method public static final synthetic access$getKey$p(Lno/tghack/gaiainvaders/JokeActivity;)Ljava/lang/String;
    .locals 0

    .line 15
    iget-object p0, p0, Lno/tghack/gaiainvaders/JokeActivity;->key:Ljava/lang/String;

    return-object p0
.end method

.method public static final synthetic access$showHide(Lno/tghack/gaiainvaders/JokeActivity;Landroid/view/View;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lno/tghack/gaiainvaders/JokeActivity;->showHide(Landroid/view/View;)V

    return-void
.end method

.method private final decryptAnswer(Ljava/lang/String;Landroid/widget/TextView;)V
    .locals 1

    .line 35
    iget-object v0, p0, Lno/tghack/gaiainvaders/JokeActivity;->ciphertext:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lno/tghack/gaiainvaders/JokeActivity;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Decrypted: "

    .line 36
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private final showHide(Landroid/view/View;)V
    .locals 1

    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public _$_clearFindViewByIdCache()V
    .locals 1

    iget-object v0, p0, Lno/tghack/gaiainvaders/JokeActivity;->_$_findViewCache:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    :cond_0
    return-void
.end method

.method public _$_findCachedViewById(I)Landroid/view/View;
    .locals 2

    iget-object v0, p0, Lno/tghack/gaiainvaders/JokeActivity;->_$_findViewCache:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lno/tghack/gaiainvaders/JokeActivity;->_$_findViewCache:Ljava/util/HashMap;

    :cond_0
    iget-object v0, p0, Lno/tghack/gaiainvaders/JokeActivity;->_$_findViewCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_1

    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lno/tghack/gaiainvaders/JokeActivity;->_$_findViewCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v0
.end method

.method public final decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "b64key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "b64ciphertext"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 50
    invoke-static {p1, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    const-string v1, "Base64.decode(b64key, Base64.DEFAULT)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    array-length v2, p1

    const-string v3, "AES"

    invoke-direct {v1, p1, v0, v2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BIILjava/lang/String;)V

    const-string p1, "BC"

    .line 53
    invoke-static {v3, p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object p1

    .line 54
    check-cast v1, Ljava/security/Key;

    new-instance v2, Ljavax/crypto/spec/IvParameterSpec;

    const-string v3, "cipher"

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljavax/crypto/Cipher;->getBlockSize()I

    move-result v3

    new-array v3, v3, [B

    invoke-direct {v2, v3}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    check-cast v2, Ljava/security/spec/AlgorithmParameterSpec;

    const/4 v3, 0x2

    invoke-virtual {p1, v3, v1, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 55
    invoke-static {p2, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p2

    const-string v0, "Base64.decode(b64ciphertext, Base64.DEFAULT)"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    invoke-virtual {p1, p2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    const-string p2, "decrypted"

    .line 57
    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "UTF-8"

    invoke-static {p2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p2

    const-string v0, "Charset.forName(charsetName)"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 20
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001d

    .line 21
    invoke-virtual {p0, p1}, Lno/tghack/gaiainvaders/JokeActivity;->setContentView(I)V

    const p1, 0x7f090023

    .line 25
    invoke-virtual {p0, p1}, Lno/tghack/gaiainvaders/JokeActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    const v0, 0x7f09001d

    .line 26
    invoke-virtual {p0, v0}, Lno/tghack/gaiainvaders/JokeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 28
    new-instance v1, Lno/tghack/gaiainvaders/JokeActivity$onCreate$1;

    invoke-direct {v1, p0, v0}, Lno/tghack/gaiainvaders/JokeActivity$onCreate$1;-><init>(Lno/tghack/gaiainvaders/JokeActivity;Landroid/widget/TextView;)V

    check-cast v1, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
