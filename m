Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712473A75B6
	for <mfd@lists.linux.dev>; Fri,  7 Aug 2026 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078318; cv=none; b=OwVZBnEp8/4BXnh5xHnqBZFgfU2pXkofQnB7VqYhL1hwceIoTwiG7U0dKwcC0yQbxxV0dwyni5Cg5QGBNWLUMZDt7qKGfPaqZoGGW9OZSZQ/jXmHe7vHaJeJCmSr0QL2e0m+Ftppvcd1B2Na/08wU7kY2SV9y9/CijuUaXvJ/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078318; c=relaxed/simple;
	bh=akgH7FdSu8hkxoqBxRW5GrRYagY+QZDl3N0wKNP3Em8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBfHrmEC8L4ZntdhMTNo0XHNug5cg1U4lcsGumTjPatqQecL/6m85Sm1qwmIWKWtdG18iVmq5bjfK0mHg0WR8cWK3+cNPyA2P7kOrLDTAAXp/P7vsZZueaX0lCaZyUrKz07tUPmpMDPgrjCf3D5vh9L0rg3HQNdHvK02Ko71p4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImZQ7/ni; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImZQ7/ni"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6aae90e595fso1352500eaf.1
        for <mfd@lists.linux.dev>; Thu, 06 Aug 2026 21:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786078299; x=1786683099; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3lkDhLHoHy7Deukicju73PIuJo/3t9WiJOLY5QufbM=;
        b=ImZQ7/niJaHtkTjZGW7USCrmB6tbVqNFOciZ/Oe4NUtyd2B10TMmgIn7vhGhzcN1x8
         TN71lXK2Wyd1D5/AfV0VS7Dg/u6B8KQrC8tSFL/OaTHjSXh6RR/kQ9IRdzV7SdMZxD7a
         Te+MF9LpcPG0mo34k3g4c7o4PakyUx24kIdwNlBF7hcaF/waMaSYu8L3236H4kismO1V
         cGpfXWXEZTxE7eML2N9bJ6FRnrriyiirOD2YEhKMMSpE2RFzZNdtvVcju8ga0v81A5l/
         a2+T+RBBAMZrz1mJNtZb0B4GOVL+wdoI0O8jJvPbDTbzC1ytRa2/PvKvrIf2PL6YRjS8
         lN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786078299; x=1786683099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3lkDhLHoHy7Deukicju73PIuJo/3t9WiJOLY5QufbM=;
        b=laaNax06pDWoB/oJGu+M5HTe0wnRnp/9hiUvPL+DXxx8r1jw1QSbWQmeb540GVBjk4
         VdkJB2QuBs1K7Ur7lE2NK9dIjcKSfWsesDc1xUs0LwYhThL1hKDnJPEPoOGCW+1XmgQP
         SInUrMDz4DBSJYMJ6pZn/JpaVsojsFuFZjKk+yoIdi7uFljd7ZgBbe351WiImfgW5N1k
         PL6PTyGyPPfRhH9uE6fWkIAbDxgJohiHUTnfz9nZd/p+2cJQcoWiKHEww/+fhOVj1pMp
         sFZIbCIJbhibOcBhGxEgjGRcTePJQjdvVQuPNBtkRdmXKV1b3Jr5J5u1ftCOWX27sVF9
         snHA==
X-Gm-Message-State: AOJu0Yw+3UPmHe5bhJR4uOJS/6rR4D2m66csHaEGVGz1agBRcUMfprP6
	jSKHzeAKJhe7/fDE2N2WY/1/TRgKT5cSfE3FA2i7XGnJDk7zlY8SJPcs
X-Gm-Gg: AR+sD11l/y0XsMHHooGmYpYQGv1mRYu0qe/WgQVdGTn+s1dutVGMdLA5fIIu7JfcEFw
	SHOaioEnFtO7SjhFrqE9e3wKKzDdsVn4HLUF6WK5pUxEL+tKI5adSjXwKvfwgkCk/wzFBbcOCzu
	ok1lMmyOfUkxXsCahcPPgF8jpJi6qp5LtzMHs87qbmzKPVv/W3tDfmN5MqkUFKvx8B7j0OlkOiy
	ThvJIbNfG9MbcYvPmhNZHpJXAOXKhLQs76qYXP+mNsZjVyExPL6TELIOoXTcdONyS1q3aRUERhk
	6ePBC8TMi5VwyF5Y6vHblLRgcKSQPmuavzNYDOTtOvuRsxyc2d1CllXJUtcSklwkmCUskkUsQD9
	Wib4i65AcU0pvttWbqAvWky+HvMz6o7oIf+IbCQ3kmZEBCc2fZWJiaMQ/QIiF2+JFDYrCGJsCLW
	fwipgSdYEvxq7550O3eE3ELKPKq2hqfiBwgIFGxyQ207j0V/fqYZg2vTOJfnjZ+ckyeewd06Ft1
	Q9gSQ9WQlKEoeDh9ADoGDo1xxP7/KDEm3gwXIvuH1mQQ4wbEnKrO/HFQZBECVT1oR8p7ZBtthcT
	ExSpW76uE2n+tRafac6VG9yd65UcCyo2uYw31kx0TGnuRbetwyqKoNtHqAXLe2mfNTCiC8HMkbE
	TFtam57PpZr0Y4gLB3Q==
X-Received: by 2002:a05:6820:1996:b0:6b0:1b86:fa8 with SMTP id 006d021491bc7-6b01b8625afmr4347810eaf.15.1786078298727;
        Thu, 06 Aug 2026 21:51:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02bbbf755sm1519726eaf.2.2026.08.06.21.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 21:51:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 06 Aug 2026 22:51:26 -0600
Subject: [PATCH net-next v4 1/4] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-submit-acx00-of-dynamic-v1-v4-1-9bf2f7441632@gmail.com>
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
In-Reply-To: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
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

