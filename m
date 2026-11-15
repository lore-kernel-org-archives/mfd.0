Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762714;
	b=uB1OuioNs4iqudoIv1a1NeVXA6f+SXSWkk+LnBxv27InDhJvotIWXL982Y3IlxosJeoK
	 cJfBPx0nDY6mf/uZ+2pCn/OLeZwbYXErcTqKg6N4buxzVxcnhLDTDiKLI9qz0EktbJjaN
	 x1Q7hBkuk6bhyxEssU38OA+BcUrVmWkXPi1jJGViDWguzgPAh8iqIHf1rnnRjngIXSLVj
	 t2GV3012bAuA3o91yBGJs2ZvoGBdGBqhgN3wptLsz7I3prVtz7DksZqXjv4JbBNcXZx7o
	 uAZ8sYzNzMdnJDP4wm1Qnv2ihPRZjoZVB45pbfSgfa3etasE9eBR6fi2FNv9k8oGoTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mZe5nxMVVSQwhBrOC2mg7Pyqnc/0mg16GtD+fLJnRoY=;
	b=HTTR3blDN7Hx0fWd0alyo/Xf4x/TAAwentQKhvuNJNmQRS7NxiJi2T9yQFix3xNmZJYm
	 z7LZJdvv77Lz6ZJ8s/3Yx4qB+Yw92BPfqk9q554S8Bex51+pp8cZCefe/wqrHOi76q9vJ
	 oqsrFvD3iE7xEefCOI0yGFvcvVzzU+qlkOUVoyCUmPHAr2D5mKOQoreKPD3/EzWP9jzIV
	 mFZEeuRjxzR8wCNLKc/6NlvoNJNWrAcP5AnL2QW2FrvV6XSRGiA1wr7Uux4HPSfQhzAl/
	 n4atVP6u7T1S+TVtW9D7IeaFFw/QOvhWMdUE3LrXibb4yq9ivoBBSWgb0/fH0UwITTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=Wt55wUio;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027F9606A32E
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 17:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 027F9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=Wt55wUio
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so30523965e9.2
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762712; x=1795367512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZe5nxMVVSQwhBrOC2mg7Pyqnc/0mg16GtD+fLJnRoY=;
        b=Wt55wUioekpCG75qYVD5I80p196Lnsao6EUYLiPbD5V7qiV7ERZz2ZIRwquzrkRstx
         rqWeTRiFjJTuFsd+cyUVvI0b/GiBVzCoUn+Y7ARtiVHkw1bXMvwNpJkSH1DYSldgOnhG
         EvLsmJfqcIBLOWygZbK1fTNC2+XLnwzCfW99+gAma325NaZ1V04T0UIHmfLNLfsCVlNN
         hA3gFB6zDqDGeFDKVLFybHgP+STegEIedQk6gBYVUqAkymIk403yQHH5lffye5hDGKcp
         PY2mi11U8ea65Lq+7t46SWeIgg9nPRytut93nE1WpSoSw18/I348FXhg8KR5C3TpnpEy
         2vbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762712; x=1795367512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZe5nxMVVSQwhBrOC2mg7Pyqnc/0mg16GtD+fLJnRoY=;
        b=KozttiRdoXJQ2lYcQvgBbE80LBo3D0rGvAX7Q7+qruTeGezNiSun+dgy+0zkbGQG4A
         EtZYIsNDbpJDmHQZ+4oz+nThHLUnAS3QBn692IKs6SewtAr71GGry37gNvd+mSHW9Dhf
         LLQ5PPGvKoS53Op8BfTdtC47Yw965tu+y33Ll+kWUAXbsV89WiAso9vU9jy68phqMlVE
         gO8L5WknLJ8SbPHjFs10ShkNtzkVC8Jmnd+bOW39oGJqFzNIGZ8DsRwiIzn8IgAdSrel
         0QvBjCe5Zjxu08BK474mgiNorg08LyB+gMYNtbstJscEQj5HSYJ2UrJjRkYRIJJxQcph
         UxTg==
X-Forwarded-Encrypted: i=1; AL+hErEkwmP85XojuMOBPBpXJG+BVJu9h5/rRwfUhgvjcoFfpj1yoSWsAEd7+dH5ki1u3NRlQM4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/LbaLRw3MgJ2dgIeEYoPDj087PQnqdlnk+x20cx/S9J2SSmunb
	bOOYcvylzpxjdRPwm1bQA/8k64rWuKlmsyHplWtpa+Y/juojYrB/Z6+bxK3FwYureYw=
X-Gm-Gg: AYBFou1+s3a6U4CctDVM/5+JLVSOd+gTTN2QZ2OWMpiMSfiGp23XaQV9OpW8Hxl8t/n
	b+NbOoWLvKy2dfjk9IACANCzZxygbvstdc8DC1nCk3kzkzXjUnDv0atiif/VmG2lY1MO0zKOQhj
	Oi6pPhXRVTRYjyB5AazuBFMN041ZHVPOcZru/dnKaaxBGL68m3aLiDrRlxYOmdbwmH0BHZk9A9I
	04b0aYIytSeqOrqZthc3Wgrcz6sMKZ+NjAFrQHR1Tt5LempBqZywJIMzAmWtmkxwvRSD3iJnwWW
	qFBupBb1EH+v8LN8ExQumtfTDTqcrorYCH0/z0Nu8B/wVVvjO8cAn1Keuvl6BSqpf8jtRhgOzhg
	vO4TO3ZT8VC8OOtNKobw4iGs3Qq3QMiBq3IZAWfzLG3Rehdvn4BGTQOT5VLn7StD7hLCQ9AXSV/
	utUkRgY1490BXtNIQA1mA4THJeNi4lpEiFHoh1Qif/uTl8RCgWeCEvui8JdEWVKpVY1NAGexGWy
	fgbqhDKQuW7IbDgjUQIKpGyYWwYo9Kx4q10YJiLlAmw/KIRxvQWPZG4c+tpvND4w5rQxtYfVZcT
	7tHmhlSkcvADg6SqWpPexLF3YhQRNeAYbM58RKkkhSxQuigaEKso0coEzJPwIQ==
X-Received: by 2002:a05:600c:6097:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb66265d0bmr83499815e9.20.1794762712411;
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: mfd: x-powers,axp152: Add the AXP2101
Date: Sun, 15 Nov 2026 18:11:44 +0100
Message-ID: <20261115171150.64431-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115171150.64431-1-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AXP2101's interrupt line is optional, as for the AXP313A and the
AXP15060: the driver then registers only the regulators. It has no DCDC
frequency setting.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..024de5553d6b 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -69,6 +69,7 @@ allOf:
             contains:
               enum:
                 - x-powers,axp15060
+                - x-powers,axp2101
                 - x-powers,axp305
                 - x-powers,axp313a
                 - x-powers,axp323
@@ -85,6 +86,7 @@ allOf:
               - x-powers,axp313a
               - x-powers,axp323
               - x-powers,axp15060
+              - x-powers,axp2101
               - x-powers,axp717
 
     then:
@@ -108,6 +110,7 @@ properties:
           - x-powers,axp806
           - x-powers,axp809
           - x-powers,axp813
+          - x-powers,axp2101
           - x-powers,axp15060
       - items:
           - const: x-powers,axp228
-- 
2.39.5

