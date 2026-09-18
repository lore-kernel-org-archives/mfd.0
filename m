Received: from mail-oa2-f10.google.com (mail-oa2-f10.google.com [74.125.231.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715EE3FFAAA
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 04:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707484; cv=none; b=ha94GKpGlB678blR1kN8Vrmqh57kuOYOiCmNzmcJS1DLJ9xWKFNfn9oyEgJC3J+elIY8sp2AmVsZhBZWz5OwHIOdfS/YS/gvhOXaOicc+iuK7OaY9IoHyG9oyF6Qt6Nr2D3LtTmBRfE+JGoHrUOlcEu6/Ijyer/SV8HeBb48+7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707484; c=relaxed/simple;
	bh=QApoySis0Adh6uF/PzHVfhA1jkpjYHZNgPhek+gBJ7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uxp3KPhI0ouYv4yOJYD3zxuZgUHAEU4kiaIVahRsZyR5pdaHA1XwJz0/dVYFJ2rrK647DvZVmkwDZbGGhfpmFKaJ1o0i8fytWcgJkXHdtTTIJFYOZM0bBc7C07cgSE2f6H6lIrq3GTjLFExOxQM1oUfKwOJec0kmWsK6UoHKWj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2Z9X3zf; arc=none smtp.client-ip=74.125.231.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2Z9X3zf"
Received: by mail-oa2-f10.google.com with SMTP id 586e51a60fabf-46adea418f3so98105fac.1
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 21:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707480; x=1790312280; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqClDMZv+Qp3g2QhTysx0rBLnCkZVZnC/Rs9Rzbs0+0=;
        b=K2Z9X3zfAPCwFgj7zW/AjF+kHEH9+MSGu1TQgWfVZqgP/YEMT6gzg8dkaJotQdlbcJ
         XTbRr+LsPxIF5/ty/jKSFuz7g8BV8n4CnQEO5z2B3KEdumqU5vF/vL/Epg/f76qBl0ax
         d5Ppy6ImLFf9VADlAhnuRG7Y3fp6PX3O+dtb2T5QjTruOunWB5Qv7bxOiP7G4t8lXj7/
         GS13dxbIF4xwSSCjpc7Oe5EEdtJ2yalETAq3f+ZGkHBfNdUSuJyP7GFvNJA6JFyoXcpc
         bmG4vZzRZLtI+dBFhzOAZ+fkkR41DYsCjjybyLFQAoD7G5aKc5oVgoGJPsQ5Br3BvWwf
         f6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707480; x=1790312280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqClDMZv+Qp3g2QhTysx0rBLnCkZVZnC/Rs9Rzbs0+0=;
        b=UyR1WCRo37sOaauiqYj4xcQnRORZUXFQnuJ75s9KTDP7dovmCa/xIMHNkRnxAuEG1I
         yTvFEx4RN+YBbNg0BYgi0zm2YR+OAMKley1WOycM3CI3dw2yUo+8TYvcZ0h0DB3viesQ
         BWMN7fZhFYM8xHqkxjC+7nJvs0Chc1CKEfDbV5CNbKS1FIeSY9PcknZSddOlOe6VtCBQ
         IfN+d4LeenYeowRwljzaQitFYGuobSDdZ7MS0q6w4vaNpip6F07w4lwnH0K4hwm7himy
         1Z/nUFtG92S0piaBYDaiCCGTQPaWy6jgLSsJKxGTkCO05N6ItQ6Re/J8EmhEUy9NhogY
         i1Qw==
X-Forwarded-Encrypted: i=1; AKwUvBx9jyX1RRKLXzNwVKEzsMtwdRAfFuR27jEe7ea2JYhUgiEN4nQ+WEEtI0oVkOH5FW9a0+o=@lists.linux.dev
X-Gm-Message-State: AFuF++m+4swLI6/V4rEB0cY7fPMKsujED+kjoeWIv1SYCa6yeWQSdKGI
	0j4yAlMYo9uB3t5EbPZAFGTimGB6rr3dir1/iVdCvhpjO1Zg89xU65TC
X-Gm-Gg: AYBFou3zj5l/ly9HNIHmFVgAhfkI4OHtQ0qjmWMJTAdCegUypZ6urKMxPYjULPwo1An
	FsRZ50ylDGihydPgEaeK4C+BaSUXOeZFKchiOgar5a6Y3NuldVNnqTP6CKTOcac/V8LxHLthJch
	aUthKvdHGHi5egPJD91+8PCJMmAcsK4gzrmRrMJAr5kKaTTVTxsGTXRVQySnVkehneJS8pUjuqR
	AfbOARtEaUrQ7epyNNiKtD2cVD/R35hUto7xtGlSUxh6LxF1mjM7hFZ8qeKhzpfFDVfUdBV3v8A
	ft/iLgWm5mr3Xv1ank5rM10VvRgXfEiyBTPPW7vyc7sJ/u81DPh9V1hGDb4gqBkbABcoENQqm+d
	eVWBHsEujBveWFgvv7RA9+FxUum6Vd1c2ipF8+1L8NA8p+i3RutSlW6mcvZCYlcwznFwHucKy41
	gdnAj+Hto1GYX6U9RnaNn1RY3pzwaGqqy3rmedLDQTl5J4yBbRmITybUov0YO0y0IPdMDyBbRKn
	OcW
X-Received: by 2002:a05:6870:2419:b0:483:b498:9db0 with SMTP id 586e51a60fabf-486e5447154mr1433078fac.14.1789707480336;
        Thu, 17 Sep 2026 21:58:00 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48739da0d0dsm256318fac.12.2026.09.17.21.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:57:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 23:57:46 -0500
Subject: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's
 nvmem layout
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-1-558b8f95cfbc@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789707469; l=1572;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=QApoySis0Adh6uF/PzHVfhA1jkpjYHZNgPhek+gBJ7E=;
 b=mjeSErd6IUo2Z5QDXzSoT7MEYbyj3Na50gNAofJEh5wz/azQT61QJzOrgH1djAKYxTLLJUkYV
 wo88yBIlUloAzlG19N2bRJfn1YRBdEMkcgp1nZ1QQEMSYEmHHj+zw0v
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Four of the MT6397 RTC's alarm registers use only their low bits; the
high byte of each is storage the clock and the alarm don't touch.
MediaTek's documentation names them RTC_NEW_SPARE0 to RTC_NEW_SPARE3 and
assigns the first to a fuel gauge, which is what a battery driver reads
at boot so that the reported capacity does not jump across a reboot.

They sit in the RTC's always-on domain, so the driver can offer them as
a battery-backed nvmem provider. Allow a board to lay cells out over
them.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..5c89c589b53c 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -81,6 +81,15 @@ properties:
 
       start-year: true
 
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+        description:
+          The RTC carries four bytes of storage that neither the clock nor the
+          alarm uses, in the high half of four of the alarm registers, and
+          offers them as a battery-backed nvmem provider. MediaTek's
+          documentation names them RTC_NEW_SPARE0 to RTC_NEW_SPARE3 and gives
+          the first to a fuel gauge.
+
     required:
       - compatible
 

-- 
2.55.0

