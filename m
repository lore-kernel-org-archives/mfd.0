Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F5E3BBFBA
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 02:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785896911; cv=none; b=Y8o2WwZdG4bVkdxPnUrLfr2ccHLHRMaPkpXjgKLmDy3ijwI2M/Cj8mRVTkHno90NjPlAnV/a9pX+Plwy4qXXiHRyaNG3Hxhal2R2qRqANbtZuVeXYYgOKZis3VygcLxs3ecLh9F+ZTVV2ep2vVHNERwayXVSgobhvZ2UTFx4F+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785896911; c=relaxed/simple;
	bh=R6g0JPwxdv7PypX7v84NybJBf7f2xtEhtnKMo6TTQpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hGBXTgwp02eEtCHu0E/6mpthhUM6IXeUmJHLR/dFw9xaJ45e2yAIcexKFYuLXrKr46eMXcP/eS0QJ40Y2J2coWBF0kGQr+vx/Tu3PutHC1GF2P1EdV2fZZ1OtG8kpfF1AwIGmDQLDnEaMfV93QUclRke7T0yZ/lyCFS/iHMVNC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJmZNfw2; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJmZNfw2"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb545db3afso406349a34.0
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 19:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896909; x=1786501709; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azC4yJVvIjculgK3P7AokYSHVCXvbgOhfjCyepYSyOo=;
        b=TJmZNfw2XWMHOgNia+sKnEZVHrY/ucBCi/dcuKNhO14LMea1yzRZDH4/pqgysJ91jk
         2XENPd2so9bcerIkiOyhXV5d4Fgm0Vwv8IdM+wOEYvoljZYxtT0YeNenw3gYfv4xUoT+
         RN1Mqm+2xrJWRFxkBN1U8KV53FYJVAJCpLlmgC9AF1xOZ/xIKAYFn0dwaZqyJUES5kWj
         gRavk2qFVFzOEDOa8gAuMFEhSHvOwbcbpxSSjpwtPrmGi8dAbApzvQ/wxpqMm897GYru
         E4hmr1ewonQXimxnLGi5n/IPEjZs2RUeCmVQfCX3TlXkNJy+vb3dNh1pnAX+AQk7gn0Z
         GNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896909; x=1786501709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azC4yJVvIjculgK3P7AokYSHVCXvbgOhfjCyepYSyOo=;
        b=GEZth7nU3Tf4L9sJ64bn5L+9Ia0U0ekGizywGfpUpUL+FUUr3hGNJbjiUDoz3boEzR
         VBk3uFu3FDAzQOK4718dOnIzBnSOnSLNhBkui+wWlLGMAJ3h1JHOGoNAJ0XZ9spyefaT
         ZKT8vL/An7jwNV7hIcTTP3QENK4n7dbuVt5NA1YpTx8D7aNXj/TWzD4cDQ0QuWXoPx9R
         4xzEdrSSUmcraFZ4OZAGTJ5mweXgvHBsuJX7yN+XkyjFak27r7R0rqcDcFYJu2L0GoBn
         c9nw+6sC0znO6eQHw2ReKDY/lXtG7APk6zvIWXM8giJIcHTVjNXcdAw9TwBqLBOaRo7p
         gPwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPj317Pl/e0Dv9qmMabMR8qe3BejYsWqvXSUoBT8znPEckOEhMMIQ4yDYakF0QAlwlARI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvy115pSuXahLqqdpi0cH1yNM6TSUZkz38rgSkRcEKGUn8ioQY
	9tN2Ymq+vzj+ux/rrmEtaXTY3hhRLXVbIv1LLSA3UQm03jHdzn53p3IvpbpoToVk
X-Gm-Gg: AR+sD12YdtRLQ0f4ncHFzV4HbuQETyPwKlqa+Im/vZPawyt2g1EBFr54bIzA2O6PgEg
	rKKD+g2R4rZZaGqm/f7r/OraipmHhzQyVrVQtDnCVnKJ3K3J5wWNMIuU7BbRjtacLwFHXTqiE0s
	KtHb0MvkZ460+/5q0aKJXqh1CytWEvz9PmfNwcj8hCCt71WInmZFVpaVwpN5ycBqv9lFmYWoNNE
	0LbBnzQ2mVJUjpBOgxmRcG+8DYgzxTwq05i6EXOFQMwFV96njajnhgF/Qlil9Op44XANcCQFMd6
	VEXX0Dx2UnxgWKEZ0DWppKYG1GT3q6kqs+iG2/0f/q8nVGH/QpxLNGJOU2JGER2qUU1TrNZ5kKm
	wkkq7VjFPrNuwTmnhs4HtdNNkjJOKnp9d2+51SmfRGqaiRBa3tPpxUjFz0ieC4cV1gCVXJE4Xh2
	2O+igHjYR7uKazH//8UvfKe2CcZUn2kfm33CNejulPcbIh9GJ8Ap1i1l4lIHvLr4+Z0DHz6ReaF
	Xd5Y2w1IkmQ9GHqA+IaLTpN4vqt8h9nfOw20T/Ni3l9FfbdDxSOVMK9oyfDvnS1oV/z5mWh1Iau
	GiwTE9Lu/9VTkbGAxsoLUhUqv2MDwDUlhqDyO5ZcRKiK21M+JQgXH3m5NWFrESknsInaZEoS+Iz
	pSNZvIFsVOsVSNpXD
X-Received: by 2002:a05:6830:2116:b0:7d7:ed69:81b2 with SMTP id 46e09a7af769-7f1e5d0f2e8mr2637298a34.5.1785896909187;
        Tue, 04 Aug 2026 19:28:29 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:26:59 -0600
Subject: [PATCH net-next v2 1/8] dt-bindings: net: x-powers: add AC200 EPHY
 control
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-1-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC200 contains a Fast Ethernet PHY whose power, calibration and
interface-selection registers are accessed through the parent AC200 I2C
regmap.

Describe this control function and its optional SoC SID calibration
cell. The vendor sequence adds three to the calibration value modulo 16
before writing BPS_EFFUSE. If the cell is omitted, the driver reads the
AC200's internal copy of the calibration eFuse.

This node represents the package control logic, not the Clause 22 PHY.
The latter remains a separate ethernet-phy node on the MDIO bus, which
supplies its address and the MAC-selected interface mode at runtime.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac200-ephy-ctl.yaml      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
new file mode 100644
index 000000000000..5bb60542030f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac200-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 Ethernet PHY control
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 Ethernet PHY control function configures and powers the Fast
+  Ethernet PHY in the AC200. Its registers are accessed through the parent
+  AC200 I2C regmap.
+
+properties:
+  compatible:
+    const: x-powers,ac200-ephy-ctl
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Optional SoC SID cell containing the Ethernet PHY calibration value
+      written to the AC200 BPS_EFFUSE field after adding 3 modulo 16, as
+      prescribed by the vendor initialization sequence. If omitted, the
+      driver reads the AC200's internal copy of the calibration eFuse.
+
+  nvmem-cell-names:
+    const: calibration
+
+required:
+  - compatible
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+additionalProperties: false
+...

-- 
2.53.0

