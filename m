Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264383;
	b=mmiel5P4cuFqGIASdxmRMTfOzOaBDRgChc9qoC+WS/aokP7uSW5+WGIugUcd6xotlCLb
	 kicTnrsKD+SFEhz+laMf3+bWMZAh/MPxtqnv3uPTr3qxoRT8Eq8IJ4RAFMyi8W85vIP8Z
	 jWjOwzo9Z7TPV6YndNPB3F2aahRzodY+TlRtpbkL/UMbvQMzwG58LIbs7xo58aiAXpRnm
	 nrcwnv9tu19pFjOrkdnGahqh10US9Jvv6aMqD69/05mjLEkoOPKpcXBFlPtk8YwNyEjbT
	 fXPbYnr8AY6ctvnpMcB2HL7oQZWnVvHoxFmRPBdoPtql5xUq5grZqqBxuz5sRrvmh+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EWgIkiGG+9C3t4UZx8jQyb/h8aaD9D1BomPU2LdA7YI=;
	b=AWv2V5bfFSo9FoetXznRyOrd06qiV3+/oA5tCQuqYqGlP5L6mhSzzrHfI73nT/glQs43
	 zdIqgeyju7THpSVhJLFD3v5taFXqim4RZDltID+VehH4jPyWP8cU/Rac2HGnm/NbIlreH
	 fnnGpNr1d09h+guugR413R5urs4ezeCqFwNvFfmA0uTxyBwZRqJpt17v+5eBT2HKWnJFn
	 GZQ5ELbJpU6PR6a8OurPLsp1kfRGCFXlUE7r826Jvnkrl1PLaOBuEErfFNKD/JKv8rzIu
	 Cwx1UToVPTehdeuqhxa3tBLyoS++WV88S93Aa1cdK4V+YBoL9ybEPkXAl4210J41ZaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lXaoyEhr;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F27D606A320
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 08:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F27D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lXaoyEhr
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso2945298eec.0
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264382; x=1793869182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWgIkiGG+9C3t4UZx8jQyb/h8aaD9D1BomPU2LdA7YI=;
        b=lXaoyEhrjc8uekEIO6YWP3/brz7WYPE+wmrLDJ/J6npTg5Q8OjHkqzlLEAUHsH1vm8
         fdp5Fv1Anw7n7pBGSe3wjgLG3NHiFKAOBA9Y8u+XknLKtYXNqp5qOQUlL3tgll+3Sx6T
         mHKyf11CKIIO0nipBVs8ezCadGzrR0DWLzSuS+9+09fnFUsXGWYJnKI7/YtJ5alu5pva
         Ml4IZAUSI1S0wIMoJu8QPndKlq0BFzRQdO0aA3L9HjamN+uHHonXJCicVhbRpJA6xHgy
         5X71MOpgsXUmSD3KhxA+wsjhDdssuxv9JoaCsrKfIivn8ec8ww2C06zeCrbZkWQMjQ9T
         5FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264382; x=1793869182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWgIkiGG+9C3t4UZx8jQyb/h8aaD9D1BomPU2LdA7YI=;
        b=oPPSvKjz96rGs3OUWeCBtrJx4Gij+/gNQKlfUgH1k16566+IcstKVjLato/LVQE4Wb
         x//5jexVTUqIk8AKPzHqO7dAjrEJ710CvSBeo6mGMFD+zBUL80myO8Tf3sxcDbvrLpuX
         SirU++nm+JYvTYx2/5gdJslF8MODI0mldFbOlZzgU6hYWlLiT9pK56s+hyUWAyPl0Jr8
         oGDrDED0OPfYcwJYPoOfuqAB7OHryseb1IZWnW0qXM9BO2GUrrzg+Ljq2NfGTR04irRa
         jYXCaeGmkR1Bw01b3O1p0YgfRXhcramn5fjd9aLiy9Z7Qm3Yxb/izV57XW79P3rXgMX3
         tIzw==
X-Forwarded-Encrypted: i=1; AKwUvByq6uFQ7m/7Smi3J25NpzjAUP/sYfkumRgB7NaXaPAUuL1P0x7KXkwQn6goAWwAqZAI+Jc=@lists.linux.dev
X-Gm-Message-State: AFq9FYLsGNeliNFShxKAZLXHzK94yA0po57gxsFVU7aPijwbdVATVa6w
	d+WupF007Dpnv5W4m/Y4+QOt2JzvHWlWz4TsA48e5FzImLjV1wpvocY=
X-Gm-Gg: AYBFou106QnWA9UJ4s+W7kNfw4ekCSsrzp4qNWyr9cbXO9gpqXCGJwDaLbz5g/PkIJ1
	qauP6nC/5lBgilQxmdaAPnvbW1n697+p6kr+7mHZ0y4oMKxvqpFo6mtXrnqtCOczNANUggKAXmo
	xMy3j3UMIe3HmA6xnJ2gfIdh6qGlKz7oMT9rF4yEVcCQvjGoOTjXIqjgY2m7JUvn2StCTxBN9NQ
	QDALoPwcUyzkG4QQUidtnOAObWN3sF+h2myxbLIqKNtiMVpVcVCKo8RDRRYCR0flnkPCrX5fWiw
	vabOr/zCMgqVEElnVxTgltGYP8I828k6B7uUnekufCggKwofEn5G24fozEKiGYwsccyNcDpkW4I
	dPWaFea9s1fHpsZ9T/wJhY9KzbWQjECQz0V3boTaEgb7idM9nU6XpBflgRNKVKuYXOo8cotqRye
	qIvpCodloiM5SktJUypNZUobymugZ2dlNM2KxzpE44T/EdNMC8h03c6a2+ZtSrrwNvdD1T2U8aE
	YwAncMtVRqhu5b3/GywShgvOqtcSp537OomGMvjoItgQxHVtX7nALmtL8CyUIkxxaFtjDbfVxr3
	W0S+9G5rDwIlBsSU/esixIei0b4slW2gU2GeyozEFDgPRAUTkXTpZ+Y+oVa7OQ==
X-Received: by 2002:a05:693c:20c8:10b0:36a:1e0a:accb with SMTP id 5a478bee46e88-36a203e2f43mr7265770eec.35.1793264381578;
        Thu, 29 Oct 2026 01:59:41 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.20.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm16497937eec.0.2026.10.29.01.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:59:41 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [RFC PATCH 08/14] treewide: Add a flag to detect the Apple T2 chip
Date: Thu, 29 Oct 2026 04:52:05 -0400
Message-ID: <20261029085504.3547-9-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
References: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a flag to detect Apple T2 chips on Intel Macs.
Cache the result to avoid repeated checks. That will
be used in upcoming patches.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 arch/x86/kernel/quirks.c                      | 37 ++++++++++++++++++
 include/linux/platform_data/x86/apple.h       |  5 +++
 .../platform_certs/keyring_handler.h          |  8 ----
 security/integrity/platform_certs/load_uefi.c | 38 ++++---------------
 4 files changed, 50 insertions(+), 38 deletions(-)

diff --git a/arch/x86/kernel/quirks.c b/arch/x86/kernel/quirks.c
index a92f18db9..6651e5d4d 100644
--- a/arch/x86/kernel/quirks.c
+++ b/arch/x86/kernel/quirks.c
@@ -664,8 +664,45 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x2083, quirk_intel_purley_xeon_ras
 bool x86_apple_machine;
 EXPORT_SYMBOL(x86_apple_machine);
 
+bool has_apple_t2_chip;
+EXPORT_SYMBOL(has_apple_t2_chip);
+
+static const char * const __initconst apple_t2_models[] = {
+	"MacBookPro15,1",
+	"MacBookPro15,2",
+	"MacBookPro15,3",
+	"MacBookPro15,4",
+	"MacBookPro16,1",
+	"MacBookPro16,2",
+	"MacBookPro16,3",
+	"MacBookPro16,4",
+	"MacBookAir8,1",
+	"MacBookAir8,2",
+	"MacBookAir9,1",
+	"Macmini8,1",
+	"MacPro7,1",
+	"iMac20,1",
+	"iMac20,2",
+	"iMacPro1,1",
+};
+
 void __init early_platform_quirks(void)
 {
 	x86_apple_machine = dmi_match(DMI_SYS_VENDOR, "Apple Inc.") ||
 			    dmi_match(DMI_SYS_VENDOR, "Apple Computer, Inc.");
+
+	if (x86_apple_machine) {
+		const char *product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
+		int i;
+
+		if (!product_name)
+			return;
+
+		for (i = 0; i < ARRAY_SIZE(apple_t2_models); i++) {
+			if (!strcmp(product_name, apple_t2_models[i])) {
+				has_apple_t2_chip = true;
+				break;
+			}
+		}
+	}
 }
diff --git a/include/linux/platform_data/x86/apple.h b/include/linux/platform_data/x86/apple.h
index 079e816c3..47b27dcea 100644
--- a/include/linux/platform_data/x86/apple.h
+++ b/include/linux/platform_data/x86/apple.h
@@ -6,8 +6,13 @@
  * x86_apple_machine - whether the machine is an x86 Apple Macintosh
  */
 extern bool x86_apple_machine;
+/**
+ * has_apple_t2_chip - whether the machine has the Apple T2 chip
+ */
+extern bool has_apple_t2_chip;
 #else
 #define x86_apple_machine false
+#define has_apple_t2_chip false
 #endif
 
 #endif
diff --git a/security/integrity/platform_certs/keyring_handler.h b/security/integrity/platform_certs/keyring_handler.h
index f92895cc5..a355f4400 100644
--- a/security/integrity/platform_certs/keyring_handler.h
+++ b/security/integrity/platform_certs/keyring_handler.h
@@ -45,11 +45,3 @@ efi_element_handler_t get_handler_for_code_signing_keys(const efi_guid_t *sig_ty
 efi_element_handler_t get_handler_for_dbx(const efi_guid_t *sig_type);
 
 #endif
-
-#ifndef UEFI_QUIRK_SKIP_CERT
-#define UEFI_QUIRK_SKIP_CERT(vendor, product) \
-		 .matches = { \
-			DMI_MATCH(DMI_BOARD_VENDOR, vendor), \
-			DMI_MATCH(DMI_PRODUCT_NAME, product), \
-		},
-#endif
diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
index c0d694844..b4096d4c8 100644
--- a/security/integrity/platform_certs/load_uefi.c
+++ b/security/integrity/platform_certs/load_uefi.c
@@ -3,42 +3,16 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/cred.h>
-#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/efi.h>
 #include <linux/slab.h>
 #include <linux/ima.h>
+#include <linux/platform_data/x86/apple.h>
 #include <keys/asymmetric-type.h>
 #include <keys/system_keyring.h>
 #include "../integrity.h"
 #include "keyring_handler.h"
 
-/*
- * On T2 Macs reading the db and dbx efi variables to load UEFI Secure Boot
- * certificates causes occurrence of a page fault in Apple's firmware and
- * a crash disabling EFI runtime services. The following quirk skips reading
- * these variables.
- */
-static const struct dmi_system_id uefi_skip_cert[] = {
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,3") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,4") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,3") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,4") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookAir8,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookAir8,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookAir9,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "Macmini8,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacPro7,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "iMac20,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "iMac20,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "iMacPro1,1") },
-	{ }
-};
-
 /*
  * Look to see if a UEFI variable called MokIgnoreDB exists and return true if
  * it does.
@@ -165,10 +139,14 @@ static int __init load_uefi_certs(void)
 	unsigned long dbsize = 0, dbxsize = 0, mokxsize = 0;
 	efi_status_t status;
 	int rc = 0;
-	const struct dmi_system_id *dmi_id;
 
-	dmi_id = dmi_first_match(uefi_skip_cert);
-	if (dmi_id) {
+	/*
+	 * On T2 Macs reading the db and dbx efi variables to load UEFI Secure Boot
+	 * certificates causes occurrence of a page fault in Apple's firmware and
+	 * a crash disabling EFI runtime services. The following quirk skips reading
+	 * these variables.
+	 */
+	if (has_apple_t2_chip) {
 		pr_err("Reading UEFI Secure Boot Certs is not supported on T2 Macs.\n");
 		return false;
 	}
-- 
2.55.0

