Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0020B379982
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283346; cv=none; b=Ejnc7+8MAZpcUPdo2R21PiYQvtv/OfV2btidKsEC02eGsJSSKxiI79mTG3Z44PnmKLsDzuGorWPx36i34uKT5pc7QNIpDSFc0bX+svNELUnTVYXp0L98pE00vSVF7oaCgq3J1wroaadfRKq6oEbVt9AXUmyse4Y3QLs47VuZNBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283346; c=relaxed/simple;
	bh=p3VsYFoBXKb6WPzu/fYT+GrFxHpG26k5gXURQNYGlmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rt5d+a0Dmdd788AAX7nQZr8TgxCRrPPTzB++FkV2uJO4iOiw6XDnWg1ssfNPKZnQMe8w2nV8IdeY+1CJLT7gtLM+w3rOosBzCXgn+IDHnXs3Lhs5a1/FlHBNajdPc0Y/wkN6LVQLU9QchR1QT/5g7oFjMBtTtJdgi65mzjOHkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLavJG6G; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLavJG6G"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso347297b3a.1
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 20:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787283342; x=1787888142; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37lrRdVdH72rKqT8mTTOi84r0kl7oav2/onL05fr7B8=;
        b=YLavJG6GUq+C5TE8bLH6SmUgQHIgufV9vrwMfE/KFYr33PWalwAriAbrWE360YOYFG
         U2zt3i6itb9lG+Dzt6KkF/AavvemV/VPRzbYUKk+g19u3RsIFTjkRWZgMwy7CN6o6oCz
         ++O4QIuFFn/IKC/Zp5lYc8BoBeQIkyBCagi2xNmr6hrbooc90IiU5bKy4YYfKTS7PYSa
         nryvy5Hla0aXVRyytUg4hQRAG4ElOYq1JeztyvRPpfVI0FjrVlduQSsE6N9oZqI5eUKR
         fXP7hSC/f+e3cVDeOSbRvKWP83ckus6HyVpFrABufGe/T/4qjz4d1u4F5yadvVWsUAZ1
         f85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283342; x=1787888142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=37lrRdVdH72rKqT8mTTOi84r0kl7oav2/onL05fr7B8=;
        b=JV2CCaX5FLfI/aDp5ZqoZAPs0LMJ56FgvWTSnZnnPMGawD/SMZsCLZ2AyO2usm1ADf
         MTUBjZzrTcvI1C3RvJW7cbIiU9QFt/4b1oYwNKXW7OxG6OF02n1mNUdKm1gG4NFmWdlp
         maZ+WGu/us5e8+elrFAODofnfg06htTkwmHNaOf7ardf143lP0QN6Fh8DbIfNY1LMgtC
         waWgo/2GGNRgZec5mObC46eHnDCwdII2W2jXDoM8sZjDZHKQnNkNmw3qt/4vyz/lLb4W
         grxUXZg9KMDTOld9vYsRI8+1sktISUZYF0XA/9XpdEEIe6mXTDEyGWYTEDOqoLlFcg5Q
         PmcA==
X-Forwarded-Encrypted: i=1; AHgh+RpdoblZDrrjaFLPDRT7vT8wEOmnnAZjSrCvXmDYPrgBqBE/1ITNQo5tMSmR/2cPx0g9C3Y=@lists.linux.dev
X-Gm-Message-State: AFuF++lcm+JfkA+WNXHs6FG35zbk+qcEWdfipW/33iiMQTF8YVEaz68A
	4PI+mnCi0/50rrfXrWlJxiEBVeXoqWMqZ+53VFXWT858VQJxiyT7aaN0
X-Gm-Gg: AR+sD1085g4/rfivA6QS0gsIiTIrp25S6zNJwTeipio+qF3IZpZEPEArVwOAP0Jwx2s
	yKLOgOUKXVq9WYGa4fXpHKCF7Yh17y9wNYrsx1KUKdvsin4SbDVQaJNCaLZFuwKk+wuQBKANZO0
	ffIgF5JSRM0CcTGLmIePLzyf4r1hrGJetu2wfW/fn0s83kKMuV5ba2idR9l9JN3lc0ngo8PjWTV
	qUuZPfyJPbfEJjZCsAr6Kc3R+R+WclkTyUtsmlaiNxGhkqgtWdNQai2DjNvNvb9AnzgB0MK6zZ/
	gJRPmD8mw1G5tjlI5IrV/xO1dMPdz+jPWutnuN1n1D0ZwSi9jhp20aaxFb50LEf4kty0gNGdOT3
	/HldD1x6PkFBHiJGzcyIuHJ7FZbngJpP+fNlWfszho79Qr/oyrKEyizJKArlrLEgmA2hFJ6g3IW
	yLRKJpqv2TsM6iZ8LXs+HEB0k01fQrWbHApK2ikXHcFeQa/smiVqy4S1br3/Dw78ZfiY4UQxsq1
	s9UJC/ks0L748F6OOkoS0F1CmcxD9M=
X-Received: by 2002:a05:6a00:410f:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-851f972a856mr5396641b3a.1.1787283342432;
        Thu, 20 Aug 2026 20:35:42 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15891a04csm2204271a12.15.2026.08.20.20.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:35:42 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v7 08/10] mfd: nct6694: Submit the interrupt URB after the core is registered
Date: Fri, 21 Aug 2026 11:35:03 +0800
Message-Id: <20260821033505.4017901-9-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821033505.4017901-1-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The interrupt URB is submitted before nct6694_core_probe() creates the
IRQ domain. A device completing the URB early makes the callback pass a
NULL domain to irq_find_mapping(), which then falls back to the default
domain and dispatches interrupts the device does not own.

Submit the URB once the core is registered, and kill it before the core
is removed so the callback never runs without a domain.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v7:
- New patch. Fixes the URB-before-IRQ-domain race reported on v6
  patch 6/7.

 drivers/mfd/nct6694-usb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
index c8667984df5e..cc3e7b7b3a0d 100644
--- a/drivers/mfd/nct6694-usb.c
+++ b/drivers/mfd/nct6694-usb.c
@@ -312,20 +312,20 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 			 udata->int_buffer, sizeof(*udata->int_buffer), nct6694_usb_int_callback,
 			 nct6694, int_endpoint->bInterval);
 
-	ret = usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
-	if (ret)
-		goto err_urb;
-
 	usb_set_intfdata(iface, nct6694);
 
 	ret = nct6694_core_probe(dev, nct6694, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
 	if (ret)
-		goto err_mfd;
+		goto err_urb;
+
+	ret = usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
+	if (ret)
+		goto err_core;
 
 	return 0;
 
-err_mfd:
-	usb_kill_urb(udata->int_in_urb);
+err_core:
+	nct6694_core_remove(nct6694);
 err_urb:
 	usb_free_urb(udata->int_in_urb);
 	return ret;
@@ -336,8 +336,8 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
 	struct nct6694 *nct6694 = usb_get_intfdata(iface);
 	struct nct6694_usb_data *udata = nct6694->priv;
 
-	nct6694_core_remove(nct6694);
 	usb_kill_urb(udata->int_in_urb);
+	nct6694_core_remove(nct6694);
 	usb_free_urb(udata->int_in_urb);
 }
 
-- 
2.34.1

