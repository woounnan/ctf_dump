.class public final Lno/tghack/gaiainvaders/PseudoSecureRandom;
.super Ljava/security/SecureRandom;
.source "PseudoSecureRandom.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;,
        Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomProvider;,
        Lno/tghack/gaiainvaders/PseudoSecureRandom$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0005\u0018\u0000 \u00052\u00020\u0001:\u0003\u0005\u0006\u0007B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004\u00a8\u0006\u0008"
    }
    d2 = {
        "Lno/tghack/gaiainvaders/PseudoSecureRandom;",
        "Ljava/security/SecureRandom;",
        "seed",
        "",
        "([B)V",
        "Companion",
        "PseudoSecureRandomProvider",
        "PseudoSecureRandomSpi",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final Companion:Lno/tghack/gaiainvaders/PseudoSecureRandom$Companion;

.field private static final PROVIDER:Ljava/security/Provider;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lno/tghack/gaiainvaders/PseudoSecureRandom$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lno/tghack/gaiainvaders/PseudoSecureRandom$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lno/tghack/gaiainvaders/PseudoSecureRandom;->Companion:Lno/tghack/gaiainvaders/PseudoSecureRandom$Companion;

    .line 51
    new-instance v0, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomProvider;

    invoke-direct {v0}, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomProvider;-><init>()V

    check-cast v0, Ljava/security/Provider;

    sput-object v0, Lno/tghack/gaiainvaders/PseudoSecureRandom;->PROVIDER:Ljava/security/Provider;

    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    const-string v0, "seed"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    new-instance v0, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;

    invoke-direct {v0, p1}, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomSpi;-><init>([B)V

    check-cast v0, Ljava/security/SecureRandomSpi;

    sget-object p1, Lno/tghack/gaiainvaders/PseudoSecureRandom;->PROVIDER:Ljava/security/Provider;

    invoke-direct {p0, v0, p1}, Ljava/security/SecureRandom;-><init>(Ljava/security/SecureRandomSpi;Ljava/security/Provider;)V

    return-void
.end method
