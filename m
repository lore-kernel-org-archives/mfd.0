Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264410;
	b=DyQrylpenaUFgQXassKD7JxH88GQGUpJvqI1Emu3zGsOgwKAbtiTG7Uj+oME+dwHlnRw
	 0cVyhVlR3xCKmc0xwrhbgZ3zsFQlrC1PFxcwyQJCpwcLoe/G0co72bJimXd4GPEe5pUP5
	 Xse5iRWjj5FdhRkY4+Wgy0om36o+f+dz05h8GTsVEEZinBvHXmLWNS05vBER7YKPNWM3t
	 rueKVZcuE0geGIoYiIUbcnD91mnZBd9tCl9+GpSXkTCHbjfjHgIMaZ/I2h1I/w8P4IVpE
	 mT/u5hYkrDxbfYQFWw5PbuP+CAw3QKEjsgFA43AO7z2MlBUp4Cn7uk0XKgOE90j1Shw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bas+A2pwMPdYKlr8K9rmQmJzztUh1FCL0UJNjmXGJUs=;
	b=OPSk/yV/r0hiGkIAfXs+l6Kj2l6c8xZJVHA6hqqD0rTTRjjAIp0DMm9aK+I+apBqhto2
	 J/GwaZh+vuw/L9sTiwe4nG0Nn5PswP6f1r9l5scS+JD2Mnhxozr3XnNntGlRm/E4WGkio
	 hmfG3VTUCHJM2gP2NtMySpNA/RZzUL2p6hMiciFHOXfhHcaDmthJqf9cWXxSJebdRpluT
	 +11GA6FyWa67uDwe56w/wIqS7Yf/ysj0OiizSBB7fCzImur4lBrsEsEwN+l00yQgL2QJz
	 l64xT27HLf9FJRDUNwveUyy0j5CUq1m5MdM/TbwTte/XgVhGm16M7P+WO+ooho7UkQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLLJ8fNO;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA8606A32C
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 09:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0FA8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLLJ8fNO
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1178437eec.0
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264409; x=1793869209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bas+A2pwMPdYKlr8K9rmQmJzztUh1FCL0UJNjmXGJUs=;
        b=xLLJ8fNOm6W7/vCn5xXLBSAlYxsH6/vCczWsJecYSFlwoV/zhqbbg+t3ApwW9dqhq/
         1XPWJt8zLfhwoeEcqaBh+ccqR2EwWKXmOmptvVtqh21J2+NRyEpNWOT1QohXNHpjDc99
         W4hpNv5OAK+YML3apPv5u2ewOsQK4rojjQjRu3Q6bX3UyLPu+6oaBYbbsxBBSVvUgClw
         T20OEaX3q0k7Y9b+/V3yy/xKDqAUWMaLR1Pv+V0lePb+lL1gdnmADgKGYR7cthtct6zQ
         pdXinEauPo1NLZyyv+xH+dmo6G/8zpulQFldiJtRtCR23qN/3Rfr6D4gaVXJPZzotjEm
         6wxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264409; x=1793869209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bas+A2pwMPdYKlr8K9rmQmJzztUh1FCL0UJNjmXGJUs=;
        b=DBh9hTwY+FT9V5c78HXlhMlmUf63NKbw2dEYgfpUsjRv5wjeJX6v4xQYU0/8A6xqhX
         vKaDuB/qg7cgtXy2A1q39XRvhAih9281MsOtz8IA7c8cXDZAR7W7gX3SG06eZ45NxfFp
         1/2xTyQ56/134xulcuL2yNjI1ctgZgbyEjTw67j4248dtcx7nN3P1NtHYWtrbSVqflGy
         aIg8neABwJ25w329h+KC3OLRfc091HInS7/HI4B1AfVPyJov2XE+lXISGpjVSHbg5j/v
         Hz5BWqC+ZKzSdUs0LqjHcFQTBHwd0S79DgOSnzeVZ9K/1WB5rT84GGijKvtfV+U4HO6e
         wASg==
X-Forwarded-Encrypted: i=1; AKwUvBxpFbGHmdkPud0ezyzw+QwEqHcikaUZTBN++Uc/X977rZRIQM5pKXPcCyuq97KwGeKNe8w=@lists.linux.dev
X-Gm-Message-State: AFq9FYIP/phtdDLjRG20nBePgo805DxxAQq7DOvrLcRYXhnqXQE8Sz8M
	pijkO8r08ZVmI+N8lTAKB9d7Ki7Zo5Queg4g9Dum3otaTCsypURl1nw=
X-Gm-Gg: AYBFou3lWAtDGUY+U+PekPJcyxZ03o0LtxXsNDYjZ481RB51GyQfICW7b0edokEgeW2
	s262f0BKH8wRRWVwWLz8I3mw35lgi+RO0xxYL1USM9Ng9+B94ATNIDJfO5TBf2KlyxeVNzXzKEQ
	qhg3CSDtiw9RZN46G5jyS3FpNJXrY9ZwxdZU2nTYj4IiB4ZULQvStuiYjpiCI/NuoM4SRNHTqid
	jVKXXv4eDBAG6pyffyHhH59xasyMvhT0T8N+7r5D4lagztYvU5VQYRVAzNYONfNhhXHZDRVTaeJ
	mTaETRtRlwJkcT6aSI2Dbka7KZJsNNJuS4SD/z8ooqawjuwCRgua+HIdoD3U1YmIJV7aJ7sJhDD
	ABxv6CtgO4hVVYwyBgvD+nb43KwQuHxIzRGA3ZHYpBp7vDGCkW26hTAgJBzS0+U9AnXT0cFA1j1
	uF/FjEaHRj/7jK7nZDln1WS8f9lDReS33x7Ptfz70m7+B1/70Gbs26gMsKWaB+XeGaILUgYQ2qO
	BniuLboOWZgT0PF63L4HALM90P6MNzSmQUHPUZeLeu9vwArgz2+o6QKIoIZrWi+jHiKlTpVGo4O
	E/57WNUiyFLnzS7ApuRI0ispwcFLb0fYh7nJuDZMMbkwyNokRve8nNTXUQZieg==
X-Received: by 2002:a05:7301:d185:b0:369:fe4c:b48f with SMTP id 5a478bee46e88-36a20119d21mr7048294eec.0.1793264408741;
        Thu, 29 Oct 2026 02:00:08 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.20.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm16497937eec.0.2026.10.29.01.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:00:08 -0700 (PDT)
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
Subject: [RFC PATCH 09/14] treewide: disable other rtc's in t2 macs
Date: Thu, 29 Oct 2026 04:52:06 -0400
Message-ID: <20261029085504.3547-10-atharvatiwarilinuxdev@gmail.com>
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

The CMOS RTC and the ACPI TAD clock don't work correctly on
T2 Macs. When macsmc-rtc is enabled, turn them off on these
machines so macsmc-rtc is the only clock.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/acpi/acpi_tad.c | 4 ++++
 drivers/rtc/rtc-cmos.c  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/acpi/acpi_tad.c b/drivers/acpi/acpi_tad.c
index 45459a4ca..a137a39e5 100644
--- a/drivers/acpi/acpi_tad.c
+++ b/drivers/acpi/acpi_tad.c
@@ -28,6 +28,7 @@
 #include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
@@ -845,6 +846,9 @@ static int acpi_tad_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (IS_ENABLED(CONFIG_RTC_DRV_MACSMC) && has_apple_t2_chip)
+		caps &= ~ACPI_TAD_RT;
+
 	if (!acpi_has_method(handle, "_PRW")) {
 		dev_info(dev, "Missing _PRW\n");
 		caps &= ~(ACPI_TAD_AC_WAKE | ACPI_TAD_DC_WAKE);
diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index fa04ece15..bdb436e24 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -33,6 +33,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/spinlock.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/platform_device.h>
 #include <linux/log2.h>
 #include <linux/pm.h>
@@ -944,6 +945,9 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 		.priv = &cmos_rtc,
 	};
 
+	if (IS_ENABLED(CONFIG_RTC_DRV_MACSMC) && has_apple_t2_chip)
+		return -ENODEV;
+
 	/* there can be only one ... */
 	if (cmos_rtc.dev)
 		return -EBUSY;
-- 
2.55.0

