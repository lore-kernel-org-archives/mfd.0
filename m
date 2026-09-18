Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C349F524B0C
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 21:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765328; cv=none; b=i8AJN75UaQ0p/JFJE5z7CoH8w1sM2UR8w95JPwx0DZyJwMYgmAEoD0ztpXe2IZJOuCyzFsaRNuGyqlwZ9bYPeBzDy91/xaCjxQrXguiE59DYrj/4xmxgS5ImPkWCyqsSrYPH7Y+E+40JfcjqquFlD7cz5kQVEIF5l8iK2A8jdos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765328; c=relaxed/simple;
	bh=h2xXVlZKgqReyGTqA2at8TQj11rI+3lzMWWgGV3k0/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1yGpW50wsHtT94ZgQlHDQL/YI5VBm18ny4mEzm4Vx9dVGzuWUsXR45aRDJgglzrbKifnv2Phgq9a0uuTHG1hme4b4SFe+3UYJLeoLJU7tXM0liD7jPbO7wyljnM5+913eklPy6yQAS3Q4iXKjcVa3Q5zvay8n8dgY/JkQ/WMGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKvdNJUp; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKvdNJUp"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85368f1d484so165283b3a.1
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789765324; x=1790370124; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h38ODDWwiouXqh4d0uZxfCmE9hOLqrBLpPALHbL8zMI=;
        b=gKvdNJUprTM514uSNaWWYwI8JWSnGJp9JRQHO326lyRdz8QllHsNFlgRhpAuvneQNq
         lq+DWjlniMIpoqk6kXo7K6LcrcFVourmK1WxLv8SK6mMeC7qtRSVV6BpFT1l2pwdvOGn
         6AFxlBavcpch0zQ/6iiWUj8SG12SONTMgw8nA4v0Gmv015ksK/frVP5Mz6q5TjRr0oZJ
         QoCsn4M51QHTx8YmtuxVYOsOYFy0t3JB690cwPVsbQGYDe7wbEfNLc0EPrI6qtpC6ECf
         QPdOuoXKvK70dmgmDgGYrJpMqBkVHoGUoZy859ceZ0KSHagrOT82R+NWpjt1iUBeA2Vo
         NjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765324; x=1790370124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h38ODDWwiouXqh4d0uZxfCmE9hOLqrBLpPALHbL8zMI=;
        b=RUUwgDXUkyp2MIA4pcsxbsRySOiTRYIfccGSQjscFVWsquK2SqM49tR8avKTXX3wm0
         Zk/dJBpQge+R5xelTVya0tK1l4/VRAtm9wTTLs/jq/u2xT4lLJ4jb/wxAukOp248F8ir
         wWt2QweMDH2dUEBZl7yO5pszNWzesKcvN+0AOPmvG8ddtnKLE27lETV5SQLfkKuvgbUk
         xYxsahdRXoCS6oqDcYLNBj/ApY9veaBYrcqpAgnbDZXHKnGmtdZuxGj/DVTYt61GZFdE
         Q+KrbysRSoQblaT61fd1Lo8SMVJKhPFqu3xuJ0WMXgWBksKevNsls37Zayti4s9P5DXO
         2mxg==
X-Forwarded-Encrypted: i=1; AKwUvBzyDnm8Ab+dSfgj03B3OAl9/+lN8NhP7l2mnzlyzblq6Yrze103/MHXLcRl1hXHHsJegc0=@lists.linux.dev
X-Gm-Message-State: AFuF++m06tyui1JTA2fB3k15AkDTzm7p44DR3J5AC1Dtif8r/t0Frq60
	9c5vHV8p+hD6QNc50//WSj6X9rafN42R6z5DPyl/MQ6kJTNUv03cBDWk
X-Gm-Gg: AYBFou3rZFHzWHcfrZAtWqnrCjd/QV6nCzTBCzCF7J9HCZDRJvt/UbxwoVico5OX1L9
	nXtOoQgju66Q8qP3n/kGOjXCR4uY+b67wPa8AN/CYDCKhbvnl8mwnL95aET58ice9HXhAb8P4By
	+NSDC/qWAP3bxM00Xv/lcMzijsOC7CHYHul0x1foz+WkMqldtziTwNNxnRF6LcBvISxtePnPdgX
	3jrI7FiIVHDUILDQDuvohHYiFRwaf0YkeQKVeagW6GD8lyayhJAr4xNXOfRj6Y7u9h+GG0vAUiB
	oFSipoGKHEp+a1ax58Ak3WcPrJ+4mesxZ8urhCh6OHWZtmNywZfNhXdBx/jo1F5XeS2hJf1jjpN
	xChhnR0d1sUso5gxXb/oak20aOr3BylFwDmBBNTpZyQkJALGRHOPH0x3hDEHQqpK9TbCXPSQRnX
	3GOoBt7m7IzwgZ45TvA0M7uY4+KwhvOhuits/74Go28BhYoufb7AQAPW6ox+KXVN4+M8qC5Kl/z
	SIqY45b
X-Received: by 2002:a17:90a:282:b0:39e:b778:2b2e with SMTP id 98e67ed59e1d1-39eb7786404mr463150a91.5.1789765324132;
        Fri, 18 Sep 2026 14:02:04 -0700 (PDT)
Received: from [10.198.60.252] ([2409:40c2:5404:cbbd:a461:609f:eccf:23f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55ab3a3sm1396904c88.5.2026.09.18.14.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:02:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 19 Sep 2026 02:31:22 +0530
Subject: [PATCH v3 1/4] dt-bindings: mfd: ti,tps65910: Add wakeup-source
 and GPIO hogs
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-ti-tps6586x-v3-1-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
In-Reply-To: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789765290; l=1219;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=h2xXVlZKgqReyGTqA2at8TQj11rI+3lzMWWgGV3k0/0=;
 b=PrZIb1oaJCJoaQZ52TqsTlrI9VOHr32Zwu8IJ8m+cdJ/8q3aieapZFuwECgaU/ny6xcaPQ/Jb
 u9N1RujfnTmBtUlUKps0j0RnX0QiNUfMWGab/bTTMn0YgzoUF9v4Bj9
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Device tree validation throws warnings for the TPS65911 PMIC on Tegra
boards because wakeup-source and GPIO hog nodes are not documented in
the schema, even though the hardware supports them.

Add wakeup-source property and allow child nodes that match the "-hog"
pattern.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0c..caff9dc0b2bb 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -37,6 +37,8 @@ properties:
 
   interrupt-controller: true
 
+  wakeup-source: true
+
   '#interrupt-cells':
     description: Specifies the IRQ number and flags
     const: 2
@@ -163,6 +165,12 @@ patternProperties:
         vcc7-supply: VRTC input.
         vccio-supply: VIO input.
 
+  "^.+-hog$":
+    type: object
+
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg

-- 
2.55.0

