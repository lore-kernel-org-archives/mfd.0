Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EFF3C1406
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 02:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785896913; cv=none; b=JiV9z4/Tfzh/uGyW/YAUENUejg6dhMqIkck45p53/86slC2cosT+miFD3tlMzj4zd9yAAAoPcEhXNmLfKXYeo6QnNyNDOojIHwKMZD6XqvbOIszkoUtxpBSop4NPQROBIRzME97jZXIoC1WaJqwFVeqVFNYdJl2mMMdIlPFj+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785896913; c=relaxed/simple;
	bh=88UypGhQr4MP1727IeMqM86/bOK2bO2zPytpS8FWMYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8xhgLcuduXxelhyJRWGn8ZZLmY+mss2LwZiVtukhciQXL35Du+NnC9AWIqC/gjDBg3lomwmJGUVgZXs3jj0anWDHxkWn5R2W6tKKyqN2p7ontKcfpazpbhlhf0vrKbIiQ82AW5Q65uQzHvON9BzdYcjJALrbh0ZCDmOdJ2PkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlJrfCs/; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlJrfCs/"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-446f87b6de1so339773fac.3
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 19:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896910; x=1786501710; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YY4CB5Vy00/NtteUzUzKZor/e0ptbflg+HuPiVWnSpQ=;
        b=PlJrfCs/KzIiFG8LIN1nxSlF1SkM3T9r1xE12ytonoOBFQXNtbaziaAaGXjw1KqOGN
         KRMC/Ul/cf7m4IiwrQ5cR3gb39qeGpEUAQnJzwgGhDp5DhlfNZmcG3lDBkPmgk2PFgdl
         fOdDr54ljN2auIvY+BLlLto3n8Ocp2n20mk4oPA26d5kc4vMmKJomsGxC4gvTn9D3Tv6
         l+ERAFgvB3TRAt78243yHI7PU2p9NrsG18yxR8bq/EJ0b23nCYTlrmKHUe+n+TooIEVJ
         gMZmLhixS3TxHZzJ8RkfYZX40n0ZOE67hV5y2DWiwHROoS6eN1w+yhMuRA4swcBhtmQ1
         Zeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896910; x=1786501710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YY4CB5Vy00/NtteUzUzKZor/e0ptbflg+HuPiVWnSpQ=;
        b=NOZB5eJfyj0M/JZHxtKw6fP7JHXvitBdYhwIfdGcab5CiNg9s8RwZXHDPEe8ZN+NKA
         WyyYjuRWzk+NT8tAdZ7gWmuriQZfVkmgRS7zVNVBMVDsiiyLukjciuz+4U4thS1d0tKX
         pBPvMgp7/xDLRbBeL9s4avaZz+zlhFM6KsvCO0NgUnrozX8OIuz1olFj+s5UKq15esVu
         YtN0mVhIHLClT/yqcGO+hiDmWCz6m6Lr6+cNgYTQDmPlB2c4OhWR04Z6UXOCBhBx5kJR
         l0iK9C2b920+RTm57ENZDv9ThBySiDDp1yWL3F2oh6Kp1sy49mL1Wwawny1Pp3fEGNfz
         0aKw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2pBC+pL3xL4T3b0txGosTp3rXIbFeyXXuejzObFnoDc4s7NBaErMFbq13hMKNwN/NxY4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFTSMNcv62pEU9l+GihT5i4DW6LTp2cV6gQ95Aeuu3Mxlv7rTc
	JfkYTNhd616IxJHu+7luw6T+/+qL6DLi1tAL1V4wsnrWpW1n2+FqkqX1w21RwXZv
X-Gm-Gg: AR+sD12lQyLQTD8vGl3R/3uox3ka9efjMr0NNHSxMva5nT4rRwzp4HRwBGh5OCpcZru
	jTqaNjyX1V/6aA3QtxfF1nGqp/gIiB0uRM1CH/TY+xCQ++rVmxya1O4TAkPwz/VaDyruCMP8Wpf
	+eJGSvOMya4o7Syj3VWAjwB2bWHYkkUEcX6ILicsnYwm74hugH3Haz0nq5+yIoJ3yPiN+0Erc0+
	509y66sKS1UmiFjYPEYFUrt4spgRyeu11kRfSBjWKxhM9Noh8TFTl1PDteeihsWjjulYLBpYyj5
	P005MOZeKGNFzIh8Raw5Otvf/G0QLdEOdMoswp07InUbgm4PK6BNvfrlloviQf/uxOrD/R8dO43
	utGO0whXehRLjNAiEWlI0Zew/oNqbsW78ltj1UBDDstxLzq4e80+yBPEc8P2wMcw7QZ1Cmc6AwF
	8nWWPfw4Kkuztkg1j0PWKkBUvZ3kdcXAmjtuCbzu2LKh2KPKyX31Qmvx3XVjHg9YxMC2gw5H9TL
	JPPm4K4aLBrk/TGfm07CMmsJASxIreLarYj5qVI6dNRLAfJWa7yLHaxpwzTmwUWl+37/7zc92Os
	ZaHEhCsbgvAnppV9zNmPr7tZF1mc2AcgyAJGye1399cAf+jJ7LhvmuvrmBIIZz6n6Vjf13nxE0y
	OiDL90tIzIffb1e+J
X-Received: by 2002:a4a:ee12:0:b0:6a0:a791:6885 with SMTP id 006d021491bc7-6ae96ed36f7mr2063730eaf.23.1785896910119;
        Tue, 04 Aug 2026 19:28:30 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:27:00 -0600
Subject: [PATCH net-next v2 2/8] dt-bindings: mfd: x-powers: add AC200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-2-3eef49ff1d8c@gmail.com>
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

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device, its input clock, the four package supplies
and its optional Ethernet PHY control child. The input clock must run at
24 or 27 MHz when the Ethernet PHY is used, matching the rates encoded by
the documented EPHY clock selector.

Interrupt-controller and TV-encoder calibration properties can be added
with the child functions which consume them; the initial binding covers
only the common core and Ethernet control child implemented here.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..4ea56e99c370
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,77 @@
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
+  ethernet-phy-control:
+    $ref: /schemas/net/x-powers,ac200-ephy-ctl.yaml#
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
+            ethernet-phy-control {
+                compatible = "x-powers,ac200-ephy-ctl";
+                nvmem-cells = <&ephy_calibration>;
+                nvmem-cell-names = "calibration";
+            };
+        };
+    };
+...

-- 
2.53.0

