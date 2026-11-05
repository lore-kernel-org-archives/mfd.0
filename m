Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907923;
	b=QK8yfdbQDFBm97tKRfnKbRtNBrbW5JSAVYClp/dybJc2grOTyV10c6sp+2HDihP4GZbh
	 bicbXberOynpPVw65+3xUJ6GS+3coHtmuuou3ZxZVfq8ZVc01VVpLzWRQwkDfE9uCeRDh
	 UfVw9J7DGoOMiX87n4pCiiuZujOpINeFSWo4eInaDOCOiS5yKjNaQ+y6yiNJmTmyphHaZ
	 ktktYO2lfEkLTQkbYFFlZofKd2mFFievZvZV/j5z48ueqbLZvLuitofaVARvbMHi1cY68
	 apqDPFaq1lk3JEWYShrb1XB1hk0DD+nYAFhsSEdppA8AXum9gJ65L/7h+HtVBzRjchQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=dRAG6uQtQGUJy8c2Q5hmAL0Qgua1MSVXEz51SSY0ZPdAv3DnMZg5DokcBZwYDhqaujdU
	 DgwJH6t/Hm9ua0zL6ZLHJ4hG5PDyWeHJ26Fei4UsKWL/RfnXfoftOtocDnDv14CLPyl+Y
	 /6Qs20enHvncPe7awkFP5RKBQDNihnwTcl2rGZLTsRTwRi22D+lWPsL96uAC4cwHPlpw6
	 2SXQTwYUUEGIuHBCl9WhGnOpd0A2t4rgdqn9zB0cgjsZ2FFgm3Xg1Z1B260l2f25f4xBe
	 DM05cOpd9Xcnsua9nheCAZhdaPtDAOlGwWDFWJTxfq6YFIUNzNFEn5/pWRvri22i+Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1cEuQBM;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AB66079562
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 19:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80AB66079562
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1cEuQBM
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so16936805e9.0
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907922; x=1794512722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=W1cEuQBMvkrjIZlQNcEPUDRz0sOY+ybMCtfEa4Uk6OJbpSEu56SYLC1UGRDlhpzK5t
         VXXjKufuS5qJnsAPqjOicFwnUTqlFLBioJY011qNHw19Bt+O3XWrVyyP6TXT/Xu29g7p
         4yQpyC9W5cnYd855QaH0Tn3Zp9K+U+RRFtMznHcRmb473d9KxCnvYHoN6z1prFc4ja4Y
         5d8FwTo3SHizBdwlT+Irq6nEHvJtrIfo9/Tb+/4k7nMUIYpw0WbxyP7i1jiWADq9Rer2
         YLQDb5C6+FESdcX5JSxeuI4IwZyhn2whB4DM46uTZWwkNvOsUraOhVgz0DZ9yKRyPznR
         LXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907922; x=1794512722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=L+3msgKbpwbW3RIFSm8bHns/Y34n9g7qVWJzmSrik61ui7zVygoC89AtN7U1hVaia8
         iR3pQYbsGJz/X9NdLBXL0m3qPncikeSCyf4LN6WAE9qcAKAX0XZVxWTc41ccIlZTAlkK
         28T1U0gBocwn63xEKkgCIubj6YVjd2qaDnJj61RG/WqvJdgUtthk5qsvdGGvoYcaZWms
         pHf9pqGxyTq0KZmYVHzbAK/RjJUqnB5nLXkh5hNv9Bqb+BPaeXSRAQygEQJUzLCowiNJ
         7u0ZdvNdb6R8f0g3Mk4lgSP1eqw50Qw/L8jR00sEEGW8hJ1S1EcQ/Y7ipjrL3G4GcXQu
         cvlg==
X-Forwarded-Encrypted: i=1; AKwUvBzaJMHVx4tLSL5r4M24Ocy17aAMLK8xv3fsdDXOK6Yposo0jLGC2mAVcu+PPWL5F4WI0xQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9nHbHpKjV/8H2kzUidDsVD3Qc9X4fX7AePYT71rlo5wQi2Sfc/
	8M53Mnc4ldU79lcg0D8PcGJtTB7hccqVo2at5vGZFg5PPWChvC+G0P77
X-Gm-Gg: AYBFou0RetGwvQg8QVfNyHMbH/6hIbsuUwvmkl73jvN2c7NoJk7cC8s4Jo61XxCEu8G
	+2aCCT3fi3cNhH8GhepbazMLpu/l5i7g3EfObk4xJBLghKjXJwVBW9OAFTD+w3yIevw7D7sVA7/
	4FSEtrCPFcnczac21wEcgXRb3SbRZQaRPgQSey7hvWUMjZsh88J1jr0nAx2gdGLZ+klqC7d7eyc
	FlzOgIZ+BDD095hWd01b9QZosQKB2N/d5jMmxgrcYf0hbQylMm8nn793HjqAivApWZcqARDBpBT
	als3JdJcVc9zuMljwKbtchQ4mmaz/HpuVF3MCFkFlSd+L0XFI3LLbDXHxfMbcX6UO/++L/wARUH
	wOyFdy12D0fdLB8qP/sd9AeKY/SbrA/ohVONskQC44lQXMie2khcUMiUdunaCIbzmLPoLv/n3w/
	HmUyYKIdZcBCk2XTeI5Khx4DjuMd9dgQbGiqx/Xt6yAbZ6WNUv8xKmXGmCrYY9KSc4VGW/HcGpC
	oPmqW676wXqUN4sjeMN91KLNQrWJg6cieD0KSxQEAeHCP5HDefZ2Xk2vb1pU6RRuD9UNWm/cah0
	P9D8AO9qKwlSEbHyKvxiuVJE
X-Received: by 2002:a05:600c:5285:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4b6db4a9a2emr3123275e9.2.1793907921887;
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 2/8] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu,  5 Nov 2026 20:41:33 +0100
Message-ID: <20261105194426.1113050-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

