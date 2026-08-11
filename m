Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90704353EEB
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 23:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786489920; cv=none; b=lN0fIYKJP+ia7t420eQKUDykDr+ky5jE10+KohbKGlHE4c/nH6u7XKa81199/LHtx0mkk2seIW2dlets4S0Om5EZpB2AMnmUtK0sSrzFPDNN03BT1beYbEldzn3LuirOEgqYcOFN4BK8rRZ9qiGyotQhAF8s4tREBkrz4DXjF10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786489920; c=relaxed/simple;
	bh=vXJST93REa+QH10dPJYzmKclTq5eGMoIGhB/tPIJFyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfOVMJ9qHAsNwOhg0tovKnM+SIditJV+W4tf+jlGOno6TupnyORAye1CjkSNnmwEkOjT47Mllb05crnY+NJLLr2STbGDNbfHrMtKcXU1HHEdtfTtFHvOQjhPu5GDK56+ZtxoZuw6YJoJbtfVlrGi7gnaM++dDY8gMfH8Is638XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxnCBSlm; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxnCBSlm"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6aae90e595fso106114eaf.1
        for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 16:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786489917; x=1787094717; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=NxnCBSlmd3CVMG5PEhVqXR+QHu3cU6QwQi0tSZWtCI+KXjy5cY0WfagBFf2FQiahCP
         zx0Ldnv9E0uE97Qfxarzbgok3b+L0nOnC1WJtPN0C8e55SviJ+sc+SCMMFPCj5NK5BiU
         gtDl/xtPygPIIFQrI1PpNrxDrpRPzG/ZBnMHSiv3Wu0XrPIB03ZfS6A2OiP6osah2scw
         MYKaeq6wqEbhSB0r9PlcNd+eMUvi5B0SMBa5oI2rNJo0zlOjzYLi7P3ag1S7ffxRSSIk
         OgQBg+Pk8MeHeUP08MpUrzP9dub1IK5xdxvnNbaNGFm/52VR5GV98c1LwFLpQwjq4qrx
         sJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786489917; x=1787094717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=OGQlEIoVsM/tepDC6Xc6uYC7UgSdud4wH4QaErzwEebSe4OCbuta8Bx/M9ECv+lFwJ
         SMdAhHogYjWdcaUTsHrma6UgV1T3l6omd0V9ZRTxfI+/NlQbiUsjrhnh3HZMcqwLzuOl
         1LsWcfqi0F9wMH9RMgQn82B1+I21lIRC6t8ZHETxrKmnfpiW8gmu7AFdv2X2pc6nY2hI
         3vE6SPCr9d8+qRy3fL42Y3gZdDTrON8iqDQ7FcDpMz5kOsuIO8tznVxbBcp8jZvenKv2
         35b7WUGfAN7xq5MIVrmmWpPG1OLG06K5EtInofkIUy1RFFHfBRdt9oMFqxRYsV11j8JP
         kLcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTRhXvigQZbAY9tVG6eYLdFbcQch0f4Rs7FnfCXZHitsjXijWfNOk2ef1i4vqEnLawTWY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTS2/MxU6J8JDORV8e22Y8ZVWVs6/oaIf+qvBm1GZ6/B5M5FQB
	weaZcP4QxgiydGKuZ4PvmiVbMEiLSO12TyOyorQ5UdeHx+2rk6B9Rm/F
X-Gm-Gg: AR+sD11MnEPLaz+0ZsZ1UClPMY6htED1IhF7IFimCbn/BS3BPzVcVv40bnDIdAto4S3
	aSde9jPiJM/DJaj69TnaWEWiYOIgBooS4/IO7/72cgFZSSgTv6w0lDM0F3rNF0FjIP5kNPsHJQv
	raHffOwXAGFVoDM84kDQuojuZEui+iEmRaCvcxYr0yU5cIX9/xTnI5YG4kpiXpNeY6HeVErdydT
	Ksy8RBgs6FEwFTVmfQq4oBzVu/P/fgUZ3kDiq+aI7em8EZcT+005BogrIdU2IYaodKASc5Sit9A
	pZrrDBmWPO1lN3W89/P1oF59S2R98O1621m80tvw7xS0QBZ5XrPZlIr6txWjOrt7qnkxcN9e5mH
	l81ioQS/DTllbj7slB7dusHXUPfsC2PsBi+qyfIwCJNzbnlvK3jAa2Ekkk2qflmYyXVyV+twM9l
	We+V+bgSD0w86FbcCb7tI08LrDEAOycHvOJFlE/uRsntCDPli14XtEXFO1o6MYpzzm3ebpqa8TZ
	hXD8ADgI3ToxGELQ0Fh3eKadlu6y32d0hkRUeoiqJhTLPfBRqKrx/tb5HZzJlVwyEB+u0ZbcQMx
	9cob3QwlX3A5CA5d5yKeBVWeOuxQDGG7JgUXXgNZVY+puPken+Igh58ECm323bPJ01dPzsSEcfQ
	4Mid6+qAx9qYMb4FkRSyIY5vRjbI=
X-Received: by 2002:a05:6820:4b91:b0:6ac:c1b4:1a21 with SMTP id 006d021491bc7-6b0b24c8b4bmr559916eaf.6.1786489917411;
        Tue, 11 Aug 2026 16:11:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e3510fa5fsm713176fac.1.2026.08.11.16.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:11:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 17:11:30 -0600
Subject: [PATCH v7 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com>
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
In-Reply-To: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

