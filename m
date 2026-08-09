Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDE43D34A4
	for <mfd@lists.linux.dev>; Sun,  9 Aug 2026 20:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307345; cv=none; b=oWsJ6+YyYI8Z705AgQL0dToFjin1CQOZDz7Z2Wtu3SS6JFazTzgn1XOU6bQ/mp9X8yTpLs7bam+3tLtlYqe5VsuwZ3PrO63W5ss8LAWU9qZe/GXtugpxB7quF4gCZAK2Q98TTnKaLCHgOtMF5WeOYIUKZt7mjF3fnVVt9R1xV4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307345; c=relaxed/simple;
	bh=vXJST93REa+QH10dPJYzmKclTq5eGMoIGhB/tPIJFyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z9yWjEwRs4J9GNL8AYB9bf3L8jrjG6kxofkYtHdw6N4KIuKjY4y8RGAbZBV7rbZkZaJ1y0TlUqooMn7ZZoiz2fAWDUYRTntWPdkMJR2bMaD8j/p4iZEP3CLuncv+iizRlFuCJg4X1cOluhXP9GPposhuBuq3sMWgkttdKFtao0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce6O3fJH; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce6O3fJH"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6ae50ba83efso2227144eaf.0
        for <mfd@lists.linux.dev>; Sun, 09 Aug 2026 13:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307342; x=1786912142; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=ce6O3fJHVVkaEEQ0+Mqe5hMHz0YmUrN9mzg0NuhiPYY/bZjSP0UG1QTyeZJwxwPG6C
         Fo+gZTJQGCUc/W9+y/s1CA6QFFhRa93jFbN5EmpxhvC1X0Dc90eQMLl7m+zdPNLSIHCF
         5IYbFNMCbPVfkiToe8gEg6lZpC3dLTM6SHb+Y3AEvawItmOUl/2SSP7sqpns67Bq0t0D
         pPjiNnzbKid8WSFFZhk3FO0sGsijh1CAGsaYfG67VdfHhdh9BwnMezusUhRTvjzYTBUO
         yVxS59EaoVd6X+FjO87vb0CoLNLUSwGdrmqQdOVuUkNIQGJ2qsK7Ac34CLdXvq2coV7b
         9IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307342; x=1786912142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=Msf0xKDeoHTUMibs32O5Gt31U53gkzPF7BD0yTyQK/LT6h8KQvEhu88XlPtR1olzLL
         ePK/JWT90G/nJQaZmbkXybQtOOj4K2rSC7np3yOoJ6LD5bsLroROpGuSP6PuFQ7dbS3U
         XHHosTW3Nv3gakMxmLLmPSzhi5ZguBDa7Be5RMGCvSZjWM72VVlVjXDZJZCrjpLRV1aQ
         dJxv4x5JuVbVbzvePxO+qCiUrdDmZHDQrWtcvoiBIIQsKf/aUT7BMHgIOZpZp7nPT3D6
         0A8eAAfkgYN7QKvPhA/dv9jLfkvmKpTicVsT2ApD1daxDklBBfRrVOO/v70WO8meWG/u
         5LAA==
X-Gm-Message-State: AOJu0Yw0lAn43X44aRIXlAZQnMIZswQ+VN3SiNuU72hBt5oNpYHGQq16
	MURNmDcqtObwQ7oh0BNckyObywFjf899DD/omoTNl3u3iWIIrh3C/4Se
X-Gm-Gg: AR+sD12fmU6M5APdAjQF9/AqjiUj1POKaStjhv8gN2hMV4iEHA4yFfoBPmip6vx6GKm
	+X4//vkuZIf9FZ9XQafuYoSnzGhlsdjQmVVG3Iql13GJuyfVGhu+LT3lO9wcFKWDM2HtoFhFym5
	LLJr+93Z7TzLlfz1qUs9LFhPIchihXiolTiOdRcCO0T62F97Kh+67X78SLkfR5BSMTTJzjqn1UN
	2IK0ImR0Cfd8d6lq0ajO/TKhO3wg2V4QtXM9dX+CtGhENl2r4mqub9+zwID+DC85nCdMRaIjM3x
	31d7g5W5vL3z8zoU3aboN8q6kOstWvx747FsM4DU0w9KG98rMb0UCVY8oicaFkYL7fLfREwqSjH
	sVtjAaSeXq7h+Ay74aCaCBZ0ehdAiweXJZnN4pQFjowDev6byZ+Ve/TUtxu1uln+IHugWUAQP7t
	OhK7BBvcMgljd3/Zbo+3Gn1h+Xn4m+lkOLwa+utWB1qT/5sVlwV6SCq6gg+OyEJKT62N41QYup6
	1s9+Am6ozpDv+RgDA0U++jMFZUeCMx2h2Y1uWX+pGVrvv4xfkRH2qZTTRObDEVec5VmFaVgdxL4
	uIeISYEETNQRD4FneaZFCroV/klLPI8MTY7iGMAjVGjTudM092XuT9xWrvBvezDBSw7VUv+v0zg
	jAY0EOFNGaLZCYOb2a22GqBBbUWyN
X-Received: by 2002:a05:6820:1996:b0:6ae:960e:d285 with SMTP id 006d021491bc7-6b045204fa2mr7051201eaf.15.1786307342322;
        Sun, 09 Aug 2026 13:29:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f19fd31csm6975362fac.1.2026.08.09.13.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:29:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 09 Aug 2026 14:28:31 -0600
Subject: [PATCH net-next v5 1/5] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-submit-acx00-of-dynamic-v1-v5-1-bfa1f8518b28@gmail.com>
References: <20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com>
In-Reply-To: <20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device and its shared input clock. The Ethernet PHY
is represented by a PHY package on its MDIO bus, with a phandle back to
this device for access to the package control registers, so it does not
require an MFD child node. Function-specific supplies belong to their
consumer bindings rather than the shared parent.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..609831b15c80
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+        };
+    };
+...

-- 
2.53.0

