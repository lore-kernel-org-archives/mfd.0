Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7083CB54A
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 12:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475912; cv=none; b=C+k2bt+tYX2d90MQ9APpx7wEN4UpVwESDW9UHUGK+xGfaraDoqm07oGNMhjdzKhA9LeVbz+n7F4S/dnNJesqCoDhnvzyK03eMc1U9qFpamgwecUbl7O8UBkECLjURFBaFFssweVmLA5yUZyske50/PHUN9Bx2AAqngwv5ML7k68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475912; c=relaxed/simple;
	bh=5Bv9DWXKoe1rCy2VuILgNvXFcH8nqtMIfGBD86DCJpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IADChNC/+tmaiit0wck1S8mlUoIxX5aoEXm6hRMdyKKra18YHK9p2+R/Iy51WX899oOm9Pl+gohshfrgXywD/8EsZR5dsnAfhg5/N59IfCKr1BsG1vuVWXQqFkFYciqJJJsWV6SGeCl5tlX4aUWlZtzBgk+f1qKt2xKCd72s0oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZW76DvD+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZW76DvD+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso25582815e9.3
        for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475908; x=1790080708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=ZW76DvD+Zbrkd1d5uEHl+IoYZpgpi+4LYgsRg6GgP4+a07D9VYRu4iOF0yMgQUYTHD
         igeDp6nnf8WphIlVT7HpAAW/xYgu4RKFfYXmD5o2u4OAob9TrdSpSgwMfGNh12EuuUH+
         AmXZPkFERpyfhulxrOXNDHPuqYtU8RSlUoAw5jhRjg9/+lFlQWYWBbet4i94XPORNH6t
         mwylyubOjnjBMs/c2VGtYa3DJkzAywGAnWqw5s3t4wgbxaZl9z8QMlJmWbPhmd8tks0/
         lDdE7hzgpZhGAVJAiu/LyxTeuaayohG88H5NL/JUphx4W7FGTovI8BxRKiLURTUqBB0R
         vr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475908; x=1790080708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=tx32kbBxNZ3WDhF1UTLUMQCPVHKJWESYFEVDaycplxTeaNSk5BrCKin+/Rk8ZZYb5Q
         68bFghN+aF590c/kpmp5UGBO9nlextDOAanygeZA0m0MMay3h6xbd8shCqmTmT5wOF1w
         YNbeOe/fl0smbli9I5M7ALXg/Pf3O9hyv8GTHZHjwjfn5BLnn/ceFUPjScIRPKMUqF+/
         snc8vjkW8cW87OeceXGa6Ne/IbbS3NIBmYv7IMVm1y8P6Qptsv1Y4DEx4BtIOseLh3l1
         pmBI5eJ6JpcAzePTHMtPFSNXxLRzvCt0tqNB6+uBzQvVyJohILqXs1IeZaX2BgzrGg7D
         3UNg==
X-Forwarded-Encrypted: i=1; AKwUvBzQsx8Z3bzfsF03r6/VWPfH4QC/Gdebz50++mwYWvYjyzhpRLTFqQxYBNJc5whjlu5cY6k=@lists.linux.dev
X-Gm-Message-State: AFuF++nLuce5aT1lFP+Mr2XqWU0gDYN6OwRQQFVvu4Nj4he/0bIxrxc8
	1BDkpq/qE5WxgEYJnAnd2Ulmckdt6HL0kHNcyik0Tf/GCPF6F//oGVsu
X-Gm-Gg: AYBFou2FHFZwPEphImIDYujvAl+lv5qvnrKY/WgNAv/KPPcgUb97PydOyub0lGopZKL
	BvMBPnXgCKR8cmclgLe6aF76aHo2ByNuIm5UtJ4/IpTSeD9dzEf9hWE/tB3XIWvn03zloLx6dN2
	p7dZLQQ+/7B+530d6fZj09DGs2tYm6728K019C7+DS96QyVqSheO/OYBdxsw+Ft2/7BcK5Lgls1
	32tEdi3hUqNcH+sFAAGN6SpQB51bOJ3BPnmihF4ynNPtWK0gkCMtufV8lxcbci8k3m2xIhIa5uk
	UyUwUrm9RGctIgJXyWOvoL88F/lU44E/6LEnlzhiJxKVjrP6ldliVGePolNwmNSIYSRrWjwRP38
	E+EZtVu3pIgvwXisEXIGi9ou4gb541jhMHRKitPp0dnb+lK+F9E/XX3sXpZ+T8CkADELnJxPnE5
	LE6EIqKV1DoMzw9DKf0ej9R979Ny0LLU3ztN8E7wCn+pY1bnLGU5xE71RgOpDDwCCK9iogys8rk
	aFJJAK5xDduFTxAtWgbBz0ZWkle5uPB6b5M+UWbaFw6d+ITSF2TlRa1jDhDGsSoSyXPqF6Z85U=
X-Received: by 2002:a05:600c:4e47:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49e7a677cdbmr68143945e9.25.1789475907626;
        Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v22 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 15 Sep 2026 14:37:59 +0200
Message-ID: <20260915123812.14747-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.53.0

