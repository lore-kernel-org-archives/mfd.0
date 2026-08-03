Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5947738F629
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734139; cv=none; b=uGWqwF9fcA3jC3zVz1WsSniYnb+gLpEa97MiyQKX8bHzYFpABUKw1gTV4tMK8vKHw/Z+9Lfp/3Wl/LoeiS2YvvdGS4xUlWIv0PDWQh6L67pqtmbTh/jQt3yYyFvz4Dskd+U1YVl7wbQyjJmEoShSUazpej+5K8tqAj4iWusRUEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734139; c=relaxed/simple;
	bh=vV8lMZbs024nEM6mXjaIv6nOjnfVCGoiA5FCDI8jrNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elEh52t5Xc9klOHjAlsM6bJkAqOqJrgvWxFnLAoD7AHxySGpaxgxTABLAlggb5se8k5YNCsVbfjhjKC0NRECS25F1KPWhp2UvfBaN48bXvmGfuRDDFSYVAn+LUBTdj8v+jSsMKJ0LnrZJuCk6Nb2ag8PZvu4kCbjUukXX6UAVfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZX1rcUaU; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZX1rcUaU"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7ee37dc91f5so1801330a34.3
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734130; x=1786338930; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufELgsZA/AuhdmDVFD2N+JzOSgNytpSBYv7TBEiLCKU=;
        b=ZX1rcUaUJq5VWQat+cIQ+ZBcFC8dLqzdm2sR0U2Y59uXmocQhaNWRHSZm/HzJuCACh
         sCYO/r0jcwhktLUiy27eoJJFy7ATqzwSNl3ct/JWJU2e7vINf9OnCpSN7WW92iAdy/0d
         c/So+aTbwScF7BKrXhE85fx2VljmHgRSGp83XCISpCJ9nmz45xw27b+uTVrVaQTNuiyp
         52ieDpD7yMgsQqeJMHEmrZMXCjyCK5ChPAGKZeP5c/tL/sts8IpRbgpMeUx8Jabocuf8
         7vzw9mIsWUJJxFEIdZ3nWGAQZLo94ve8yU4kG/KIt9HB3XqMPxoHJEHI8Ku36uB2CVIO
         KvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734130; x=1786338930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufELgsZA/AuhdmDVFD2N+JzOSgNytpSBYv7TBEiLCKU=;
        b=QLH6Qqg+8viXvC5vrcMhCR8xeiTCwW3cjUwQgEb/uQKqROyHj14vzo+o+ClovfsPyC
         0BhbUQwmR1b1s31chcSFLKZurd7jyy2fBZ8sSTJX7gdfLsW32y+0kpmCtLuDeM+Kbz7f
         QFqdEeKfMxh8rmZopdlqjg9yhNJ7HWehJcEcpZYioVXaI8N45UXCNL4DjQ5O8dNRinp5
         ynu/NbG6wVQsqDWjSNZ7Y6i+ZMI4iVX9tLFbgNTmJht561dtuUnUBWfOVBHcPc9lpNvr
         JYUjdYwDSci1wqhDD0LAvrXKURkAkh0ElKDvtbuCmAaWKYqOuHyVPHrOHEHnzLnGuiwc
         DIHA==
X-Forwarded-Encrypted: i=1; AHgh+RrhYDcBKEfqZmuJI/kLlz+iOVvlFM1WvpnYkR5cjgLT7yeV+CXgyMVkRZLsl08s7dqPaoA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz52Kufw1o50EVUvsJttkcYzg35qXzjdOqYR+HOMvZNV3Eygr1I
	APcubmTDN+W8t0cAWY1tamatZe2rYAdjaP9sEU7v3P4to9Ky3sOynAC7
X-Gm-Gg: AR+sD11v/j/swjcUgEujrgYhyRIlkL+MwiYWjGxiqU0KF54G4TWssERLAnrqjESoXg3
	gfObh9t/Oukegd55Xm4j77nmN3k2wVdzW3bYmEt24rxQCKZRAsztt+/YGKk8x9PN85uv/VC2Z+L
	zToGf3l26jLCScqeKKz/H8el3Ci7dv+HyEsj6F/lIa+H5Zs96h8c4boD69uc9MYjd4OWiZtkwBy
	gN/XhzEz9BWIEHr18Bqa33PA+ba7M4fLw7oqSOAhvr++JndIO36UdccGKHoyrY3iGkP/8uzttBa
	Khk2K8jWs2vTU0IImxlRGRhoaFnsmc+DAhkHFDdyEb8HCpEGDJxH3srnU/1wyk4QFPB53wPJEsy
	PyUuFFJxz+3jGl9fAALagy7UNTUtOxbFf5vH/ln1YHk4I3uFoAfe4nuWfiVOzZDl+Q0Y0sXmxbS
	9gV20FCxXr8RQ5G2e6wqEi/QQUxw01uS0SoOHoT/0mi+XsPdcNzZ9DMBRbrzb3llTFuY1DjIz0h
	bnHyspGlzMuyg/pBuAMwCYSUQOuXbJTX345xAK6ZNjuRDAW2ozZnNrXIyrtqB95ADq9cHoZxjeu
	mxisO3BGj21ee7I5L18fp7OFDlV3yPkIZUBchuWgJj2c94iudflPa1lN4N0kfs0sy1lqezH3x6q
	vaZFEo7Kf5n63AdIZO8RMqbpLudyn
X-Received: by 2002:a05:6830:81f0:b0:7e9:cad9:4bd0 with SMTP id 46e09a7af769-7f196b1550cmr14686937a34.3.1785734130353;
        Sun, 02 Aug 2026 22:15:30 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:17 -0600
Subject: [PATCH 07/21] dt-bindings: net: x-powers: add AC200 EPHY control
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-7-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC200 companion IC contains a Fast Ethernet PHY controlled through
the parent AC200 I2C regmap.

Describe its control function, including the interface mode and optional
SoC SID calibration cell. The vendor sequence adds three to the calibration
value modulo 16 before writing the BPS_EFFUSE field. If the SID cell is
omitted, the driver can use the AC200's internal copy of the calibration
eFuse. The link-PHY driver supplies its Clause 22 address when enabling the
control function.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac200-ephy-ctl.yaml      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
new file mode 100644
index 000000000000..b3337c3aa62a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
@@ -0,0 +1,46 @@
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
+  phy-mode:
+    enum:
+      - mii
+      - rmii
+
+required:
+  - compatible
+  - phy-mode
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+additionalProperties: false
+...

-- 
2.53.0

