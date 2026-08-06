Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730153AAF6F
	for <mfd@lists.linux.dev>; Thu,  6 Aug 2026 01:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979473; cv=none; b=uw5K7Mjf5sMkTMvUX4ZvazrfebDUyDb9cAtipF89lRy5oxj5wl8Z71ktcfYA+4W5p6CNlzuKrsawAz3LQ9E3o2WAuY+5authIIJ15DpVx5gS0O/mQgR6redsNy0LsUggF/cXByX0YBsqX2qR/dI6cu/X0Tt6oJUYjMrOm4XT6jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979473; c=relaxed/simple;
	bh=akgH7FdSu8hkxoqBxRW5GrRYagY+QZDl3N0wKNP3Em8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cs9HKuUtiTmTHDF3KDmNDdR3PlskHspzEm7KLwTPgii+HDIf4BQDwxbjhWa+9E6/61EKuXi9jCJEUo6cBO1gluZtEY5E+e1CMnFrlLSabkNwMdvPMe7ZEmx/oPpL3PnUYkXedtiih/1VZoCf2C8FWV/M0q8KwFY4jKMpTkriAbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9P4IoiH; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9P4IoiH"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-49ff971e903so330474b6e.0
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 18:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979470; x=1786584270; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3lkDhLHoHy7Deukicju73PIuJo/3t9WiJOLY5QufbM=;
        b=q9P4IoiH0QnYJFvaFVI/q6PWU4WM3cRGgXsMBr6hNc52scszJruFbsD/3Km5q8y4bX
         19M8h8vMBeNDoBSauyKznuJ/7Ej6HEarR2euNHXxRq97LsHZc1rOsMac5AJlwDarr9+D
         RzQEvCT+X4dOwG+9g3P+kZf3iYIwOnVj9DjY+q3LMvJksQE5DGf//+W8QcCtBIC95Uli
         ul3liUjJx003hF8Axt7cdDhpkoMoLaFbwC3yy8EIL5F1zIWTY8aHzwMHYxmsKUf08hak
         w5U0cJSPAhNzLfDBzEsxJ3S1Y1Pho7XBcqSLGKSciO3P/1G/sZs45GBPnfRF/RlqC3+9
         nuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979470; x=1786584270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3lkDhLHoHy7Deukicju73PIuJo/3t9WiJOLY5QufbM=;
        b=S+XF5m18YAcJv9SaNSQhCAVaRcjGMttPJ2VExN0qdXFpF1Q0BC/k8ZV/UDSNtumvlj
         5Dcfywy+JY4qFMFNflSoTcteO6QaMbpWR1X4l6JxyXvF9K5AUhiw+G+VTmpzRGAokKvB
         p2m7Jz5/Bsf+vmMpG2jUBYRGbQApUlyU5SPip8MwUHNXkxuKAOU0HmhQDeCnBs9z7luJ
         Q5//qu/6VlTpPgEI99naHFcRDVozeeNo/rE6UHjlvVcv2vZJCmm3pGuqjPQhdhz0miOw
         Jo+nFhPf7t8bMsSReS+hy88Z1/LpcuJApmFZk7Su0572qr7mkL7nNfaR0kjWCeMnIeWb
         rJaw==
X-Gm-Message-State: AOJu0YxBT/FObWvvPEKlefcBE6nzdEBAgmoCICzz2TmqVTh91q9MBRgm
	I2GjolRFLSCTRMvI5hsKRFgYKEZFCc7LGsamNAEdqLShfDwWI7JPuaDk
X-Gm-Gg: AR+sD11C/qW2LLEwR8KvofUu0UdqutKIHsc3UTBY+pqjmHoePEQR9hKhOge6AIKSPUV
	20DbMKRdPOx7bgVUd+bFKMbky8QOjSSu0SHirpac5rXrDjO9SrVH0AhM2in3r1Uwkz2iPQarc3o
	tlK0fQtl4ijzH6UfxpaBQmhwrmVJsdYAAm64h300EvFqpQ15O2Z9rA6ck1Gh2zYg0A139Zp9SDs
	COO5o0WCt3Ehj2Y7TQ3FzeSKjEJerAriTyNi40412tQ4f0luA8VhIww/VHsi+yKJoXCErGPS8dC
	ifq/zty4fHEOyWe5Obae+DNzqjVlcQEs/huXarfE10XcmRx6c6Uhs2/ZMUccU7spjVaLAREmKqj
	kOUT9qnwiUFToJbZWvzChzreHp8zTzSuBDrdt57jTZN6iCm/aJ3ls8XNLn5NRSXqla+YWuJTldp
	HKK3YKboVHaGzIkdWX5G+OpZECJ/XQs0pEOod7UBlgKdTp0FKSv0wsUHzOjzw1DO3D2pLE6Lxr7
	Pdg7vc18VPe9Xjbgrkvw7guGPWU1RT/jiDtrV5a+xpMKAG5ic7vp1FDZ2prUN1sQxhWN4VmsK8J
	aztVhy2Cz2JLWhepqcl8HI0v9FuEY+kDjxeIwcv0M/ENFujbjX6nbLgbG71gO4cLz+30NGqKree
	FC5iOMiA31K8YqdEm
X-Received: by 2002:a05:6808:19a2:b0:4af:58c9:2541 with SMTP id 5614622812f47-4afcc0278f1mr181689b6e.15.1785979470332;
        Wed, 05 Aug 2026 18:24:30 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae75db20sm3274755b6e.14.2026.08.05.18.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 18:24:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 05 Aug 2026 19:24:18 -0600
Subject: [PATCH net-next v3 1/4] dt-bindings: mfd: x-powers: add AC200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-submit-acx00-of-dynamic-v1-v3-1-32c3210a6f25@gmail.com>
References: <20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com>
In-Reply-To: <20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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

Describe the parent device, its input clock and the four package
supplies. The Ethernet PHY is represented by a PHY package on its MDIO
bus, with a phandle back to this device for access to the package control
registers, so it does not require an MFD child node.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..b7e8d9bd5661
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,69 @@
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
+  ac-ldoin-supply:
+    description: 3.3 V supply for the audio-codec LDO input
+
+  ephy-vcc-supply:
+    description: 3.3 V supply for the Ethernet PHY analog front end
+
+  rtc-vcc-supply:
+    description: 3.3 V supply for the RTC
+
+  tv-vcc-supply:
+    description: 3.3 V supply for the TV encoder DAC
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - ac-ldoin-supply
+  - ephy-vcc-supply
+  - rtc-vcc-supply
+  - tv-vcc-supply
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
+            ac-ldoin-supply = <&reg_3v3>;
+            ephy-vcc-supply = <&reg_3v3>;
+            rtc-vcc-supply = <&reg_3v3>;
+            tv-vcc-supply = <&reg_3v3>;
+        };
+    };
+...

-- 
2.53.0

