Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B44417BD2
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436866; cv=none; b=HHB38EIY3FiR7A7ZywiEJxPmDGN8ezBtt8ryrpC5G1ls9pca9EUn5G6X05E1fE7cppAMrIM9iIvBR4o2dTdRwuN3Sb9H7MRLaf62TVqvcUtn815E4k5IxiemBrFzI1F2tvyWWB3JNrZpX+A9rU2wjsR+mjN4AVWwANRwL29g9/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436866; c=relaxed/simple;
	bh=vXJST93REa+QH10dPJYzmKclTq5eGMoIGhB/tPIJFyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMsZa8bDWh+at7M5BMz4PPnhx7VBQf1cFvIZdyRftr1Nur7LQSIx6wS7Sl7N45SchxQ9UvOK+X7FIbCP6cUplK5wPQHEwo8ozWhnCT+KWZis9dkdh+tkko6MPdmVw3WvPCqFPJU0i/iasTfyShQ2h4GrPBmF4FQ1CgZklx5JjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAfmUfZx; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAfmUfZx"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-49fa951b2c6so1493378b6e.1
        for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 01:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436864; x=1787041664; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=oAfmUfZxavX0rBscWr7VQ7JYIu2m1VVlwrS2km4FyRfwR2ZSB6g6HTOBGTfrJKZLKq
         QZqtyj1038n/m3s0oESJOXoI/A7rU14AGLtPoYIHv0Hd7eM1OPaLE7iVIqPKhDi0Yqjk
         hUq0dxWUMlmUyD6AihK5wdBSHnPT00XSPRLxEGQuT1hxxNGYrn1efllLorz2ARH80NxI
         ImMjgw6vQQv81Mhyk0kKu71CzVehRqaqLSZ5TOuhms+oCRYuNE1Tcr41Yv/VMz6FH/hn
         25o2ossRFHDVobf0XAywDfi3WnNsa/CFY1nvsoMWGi88+dRO+Gzfl1LAhQc6rIlKvGY6
         5cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436864; x=1787041664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=mqvdo96Imvn6JzfEVJMeVP+jzz71JuyJaUMgyTbMgkxcrRgptbs4gtJiqQ5C+zCjA3
         UtXkXGtFrs+eulDrKme0Y2EdsMeLL7JbRd6XNU+gzN/5jSFlyitKTjiv0yw1xQ7pxu35
         DMTkJkPWlSde+9G4w5UcEMz62HZkFjjW3QH5m8QRkCdmTdz9/lHnV9b2d5A+LYufllsA
         hwNjVrnYBP+EO6le7J5TT2tvT51r3FgaxNU3otZhtOC6/y2hVGKYig4Bnew6YNI3jXgI
         RfpMeGSWtu6sB6hoSFX1SOuTG6tsdIBET+TpNsWs5QVfrHSB4Z3dJmlb7IZuSq9KxhHx
         Qlww==
X-Gm-Message-State: AOJu0YwOz88Bif2MG2KnfvPkR5F1cGOEpfcnwXZf14C0tsSYyGUHQWGX
	lG2Ek9BE/dOZBk8GTrxrZcbpj3+ywOrVymc+zpkCcGFsENR3kB2F36ClOvu6A+0K
X-Gm-Gg: AR+sD12EieAGBPCrZOpKBiw0I6YlUnkQ2vxJWpDDdzQB+z+hHO8ZM21sGoYlEghgsUp
	VJSSMyl8DH6x/320Z58i8x7BNWSW290I3WnIKhhnkelM/SAQXt+gV3AnFQbykTDb42z4WIUUSuu
	zT9+Q1OkbFSkXU47/bVVw+BhQ0+9Rbg//4tVFcrRRIr8/4EVewwu6wjpo+Sp4Y/wISayTBgdwC/
	Yc0DhikTiDjVOmLd+90o9eKhfQyVmcj7JWsly7EeXn8BuQG1rl/oVZVaofqnNHbF+uYMy6askCw
	FUHRFFNjU/iEHhLHzf4tZWHsQ8taNEvB8V+GKRolYXyfCKD+ZtzZApee4Htv7j28oW+Dnu6mNaL
	19DWI81Bji3m7jHBTC64aWpjKM6eJYyAGvFgxAwx+lEGVvBXobCAZL8q+YLeegLesUGb5PbJqwI
	lj8hP97stBy5pzBBjFeZ+/PChzliPnHy7wG2kFnxkthwz3ezaugqgTGYDcDAVyVuMHtrx4pz+cM
	K1LGKpT7U5dSG9NPfW/s6QNmHX3NYadv9Yg00QIrDLDcGoVAEVVSixvSCalPnlXUMkpHpTUTMBF
	uGGlMrzAalKP5LrmFiyYs/VphJtSN3mRpLcocEwRcPrJ2ibZgFRHelwKbxKKm6C8eVN9M8Im9s6
	nNg/dHo3ZOOCiSzxt3xPwjShyb154
X-Received: by 2002:a05:6808:bc4:b0:4a4:c12:46f6 with SMTP id 5614622812f47-4b1fd5ef03dmr1111568b6e.2.1786436863681;
        Tue, 11 Aug 2026 01:27:43 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1fff55fdcsm318095b6e.6.2026.08.11.01.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:27:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 02:27:23 -0600
Subject: [PATCH v6 1/3] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-ac200-mfd-v6-1-c5b1292c8498@gmail.com>
References: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
In-Reply-To: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

