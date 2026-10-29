Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264466;
	b=re9fX6Yj080B6ec/CJ+BpRzI2vYXgHZDYvst4qvSYMe4A1Wl2JT8vAGEZe1/f2i4o5Dp
	 U+2F9cz7fV8OReoZ/HnCUemH82gITV+vxl4V5h7pMEfNGqvuM9C2wpM8nd3yocegnU5KU
	 YOs5dPVrreJB/9xBhzm28uCDrbRaXpIgFqgNvdZDN3fYUySnQ1ZuWX5B6JXgLQhOehFXf
	 q/ESVwiVtylxhtAQGGRpHCvJimCRpKGqTXM6+7z+MKoYUi0At30VT23HAbpV4ryTYtMPQ
	 kKlJFo8L4aydtEJzqXS36XpoERqvASsrP4eu2F16rt8+091OuNihhNa+NqNou0FzgiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z3mbcZY+neJw3cJUW+gndo2WA1VaXIZUfre4RITk+7k=;
	b=k0OgUDTBeWAoM44ShRzkahZ9a4n1vDqiI9x5Amp/bVNZjPtZo3ULu5xlCKQ5nqyUt+0u
	 aZhW3uvLHfqZOtKp2yTZCB1m659zH/JAm4b4reuRG3svjO13T1MZhFxLoeDZRGNy9iAiA
	 EraIJ+Faimy/GJxY/Xm53HTu6MvF+ORIOuXmSe613+xam3R3PnW5bxgz7Ds2XKcyZnh3m
	 Q9WX9fMc4sWYUzOBmaiL6o5KSDb8O8Of9FcJ+iEQYTQU2BMuWCSiNCulPrUUUoh6nn8XL
	 8o8ziOdAFNvQe/TDbZKQguNYn7gxabiqerpBKefCFZHbZNDDs5/PVdwqBee06+s1RIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YoI+X4Ic;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D52606A32A
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 09:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85D52606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YoI+X4Ic
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a1947498bso1261389eec.1
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264465; x=1793869265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3mbcZY+neJw3cJUW+gndo2WA1VaXIZUfre4RITk+7k=;
        b=YoI+X4IcS9XoVy86HddnYWY5eXUW0i5m5Enrtgaxzj/Z8ZTUbO2G/RLzzXKRmVI6PT
         knOpS39QyQsrZGyGmsLAQCQ6cG7sIca9mclHknXQQ6P2VAW5/67xCX7eYdBr+EOQZNdS
         WJZzXvg+W8GlF2SrnR/9fDv85Yh4vF/+i9HRcWWOEw+pEIMETEWD5prmLH9JApoOBfCY
         6CyS33NkFWJ3Vokcw7VxoSP54tpngVn9mLL44V8em31EspYWoFt+vPSIXqGja3HvtIDd
         gRF1D/Fuj5asO7gG/8d9pkTm4WXnN53Gk33GhO05UJX5FkzZS6oL3qDfMIE/xeyexaEI
         qjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264465; x=1793869265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3mbcZY+neJw3cJUW+gndo2WA1VaXIZUfre4RITk+7k=;
        b=iu5UHlJxjAe39b+M6Ji//511rsn3wJkj/Hz4ezn/ekTb2mejit+xHZSMVQznsRD54s
         k3SMTCjCz8Mwq96nS48VmNQ8gzICihiqJZUwBdbgVBYGTft+2hNCydpepctuV7NP0J9q
         TtVJVWEtc8F1JGtHIb+lE9N6o7mxNfxu9B3sa4Vq0L5AE1qgmMTIrj+lmrgi/tXnh2WS
         la22mbVDtpkty6bu9DdCrgwNh134UjjzFtr/ZpRP1U7dWg/WUDy5Fq8q4+e0geqy3Fh7
         rUcuZq1OKBE1yCHkJjXBXynkO9ErP+Ze1L6DsqTlV6t57IfJ4UClE5JJpdd2lb6fZYVC
         R+LA==
X-Forwarded-Encrypted: i=1; AKwUvBwQARtF7tSYdIoDIFfw2jcLWuH4i2SzGhKxcEBo6fkWd1MpjzmB/FagaQik1qX4mugqCiY=@lists.linux.dev
X-Gm-Message-State: AFq9FYLAyguxOsfkO686mxMb/VVxkfRtefm1iaPGFG8+EhaoQllG//DD
	auJacTaLy+Xuuy1ej0+wBD79kq5d3EtatqGXGU3MmbiCalHA2wcLWDU=
X-Gm-Gg: AYBFou3jfagYmvh5wqgbchURYxUY+cltI4f3/5iANIJEg4p6fNUbcGGdSyEBFRjuWSY
	Rzsbgv/Ke7HfXY3oX+ojnP8gTWaUoMJFNxmEp79rc2xHSEDr7adS8wFsah3PfzjjS/OIVvPQcV3
	Snp8MuK5/NfWcmTu/bb6xocbpBGmiZyv7wCfTT1bkA+rjk3hPDAgj8PiSyxIZyBfrPP48+p7gJh
	mXv0LICTffy2KEIsaI2rRe3gZlSbuPt+BB6Sa6y5cwazYxRiObg2Ol3N6b4b7KIG92b3BCSfHpg
	yYPB+x6MZS0zWRnE5WUsqMui5VIh4T23E6xtrB7lSs1cv6aCga8h8HljWxJ7yZN6JS9B7ONWUAK
	7yL4Utyes4Bqd85FXarFGhNfvo4n/b8Sl2TQ9IOMyeiBr2hdanSZkpEzLiepQ70+73B/d7MhhVg
	UXs4789VTYIKailhnuF4C8IJ4PpxxAZk+mvw+mTAL5IOsbDgxhFNT7T+FRkqHW+Y1mpJErNF0tr
	/tQ8bBjCBx09O8o2cGw65YwBeADkwyaiypiuHOGbjd/xZwBg+pWtrde8bMomdM2xh07jfGmGBTQ
	YdntO1m8qASXjKA2srQROk24FSjForETP2D3Gr4Av32dGQodzbsWPBKBmuQD9A==
X-Received: by 2002:a05:7300:f894:b0:351:207d:bff4 with SMTP id 5a478bee46e88-36a202bc360mr7083860eec.4.1793264464275;
        Thu, 29 Oct 2026 02:01:04 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.20.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm16497937eec.0.2026.10.29.02.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:01:03 -0700 (PDT)
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
Subject: [RFC PATCH 11/14] acpi: disable battery and adapter for x86 apple machines
Date: Thu, 29 Oct 2026 04:52:08 -0400
Message-ID: <20261029085504.3547-12-atharvatiwarilinuxdev@gmail.com>
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

When macsmc-power is enabled on an Intel Mac, skip acpi-sbs
and the ACPI battery and adapter drivers, since macsmc-power
now provides them. This avoids duplicate devices.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/acpi/sbs.c       | 17 +++++++++--------
 drivers/acpi/x86/utils.c |  4 ++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index f10bbf13c..b12f2acc0 100644
--- a/drivers/acpi/sbs.c
+++ b/drivers/acpi/sbs.c
@@ -634,6 +634,9 @@ static int acpi_sbs_probe(struct platform_device *pdev)
 	int result = 0;
 	int id;
 
+	if (IS_ENABLED(CONFIG_MACSMC_POWER) && x86_apple_machine)
+		return -ENODEV;
+
 	device = ACPI_COMPANION(&pdev->dev);
 	if (!device)
 		return -ENODEV;
@@ -655,14 +658,12 @@ static int acpi_sbs_probe(struct platform_device *pdev)
 
 	result = 0;
 
-	if (!x86_apple_machine) {
-		result = acpi_manager_get_info(sbs);
-		if (!result) {
-			sbs->manager_present = 1;
-			for (id = 0; id < MAX_SBS_BAT; ++id)
-				if ((sbs->batteries_supported & (1 << id)))
-					acpi_battery_add(sbs, id);
-		}
+	result = acpi_manager_get_info(sbs);
+	if (!result) {
+		sbs->manager_present = 1;
+		for (id = 0; id < MAX_SBS_BAT; ++id)
+			if ((sbs->batteries_supported & (1 << id)))
+				acpi_battery_add(sbs, id);
 	}
 
 	if (!sbs->manager_present)
diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index 418951639..9f3b9b7d9 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -14,6 +14,7 @@
 #include <linux/dmi.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/x86/apple.h>
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include "../internal.h"
@@ -608,6 +609,9 @@ bool acpi_quirk_skip_acpi_ac_and_battery(void)
 	long quirks = 0;
 	int i;
 
+	if (IS_ENABLED(CONFIG_MACSMC_POWER) && x86_apple_machine)
+		return true;
+
 	dmi_id = dmi_first_match(acpi_quirk_skip_dmi_ids);
 	if (dmi_id)
 		quirks = (unsigned long)dmi_id->driver_data;
-- 
2.55.0

