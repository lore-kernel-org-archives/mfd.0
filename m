Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295E239935E
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127392; cv=none; b=dm/oCW8p88xSoMDr8bwsyKZ2FnvfBA3/wYgz8PaBaSK9ztCBmj5hwiK9AxoP+rwn3f0EExXRmEkE6uTazUwlk+dJ71+6EBiOgWvePWzdrELCMWdSfIcbdse2butYjUOOzVG70KxXhdzLykdoUlkoR4gzzwXoQcSMf6lXZVo1q/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127392; c=relaxed/simple;
	bh=p5KuDeusVEoCUg38XXhv4wSbGDVLdalEOTq5OJM3HGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZcyXApAV5PgOfVTJ8gVyWWWo4ZH/knqHjVEfbHoM7d20eZCLLFb5/lMhlskyL4wTdtUdr5vb0A9+Gz3Yb+iXGRMKP4qQTi/kykyUdtQJfvhLjqfLR9oY74svJwGFE2s/wcoaNgBTwR22qOL7UVo1Ji977MMRStCr6akUUSK7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBFJN4y6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBFJN4y6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b779003fso24129905e9.3
        for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784127389; x=1784732189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RblpppZAMmnU5omlXvpMP24NqfykpV279MnhnwwEblY=;
        b=EBFJN4y63EZUW6rjQJEW1H6Xqs/FsA22OJTArgieiyTApKFkKYhwqkJ1IoKqwH6Dpb
         HNYOUeuI06P6O4NxB8P+tTFaa46Vt6N9d6gttbChDPcnS4JnMzgCaP4i29OrkQTGQi7P
         Q4ule8xQ8OAgcp1QUC2WAYRZnhtiprNswtsyTmao8lyGHFe0Yw7rs410Eh8GBL6onijY
         6HEabL0yQHzWw8kIw3+ZKEAYAu85+zJrep0uFdgrgZCRgYcNoqSy/OXY0yWbe2tYgVQc
         WDruVw6H8Q9iatkEfvgGd1BV7VS65FztW3t7KwAV7o+Z1y9hDryR6ys48TQrwKXADvMt
         9v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784127389; x=1784732189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RblpppZAMmnU5omlXvpMP24NqfykpV279MnhnwwEblY=;
        b=EfERY2VeSKUb/JMTk3k/H0cfIhd+Emm74xZ8NFssvlRNDL//oMnvDCCm8v026LAcJg
         J+YerfaLZT4Q2Ecj09g/dsmb1O9QlcC+dfFyXrOIDcPgObI5Nx4JODaueBE4rtgKuu3r
         croGnUvgWinvlEEeid9uWZUWH2jSjzuelbRAzOirWR1e+v53GH9kE+GAvwChgi26pFiu
         QChx3NfAIGx6kQmLl1pAGffr013UAjdXfWK1Bjo3OgayJ1wbTH4d/9f0cPeSXJd56dBa
         2eaG45Pocd8hxwZS/5TueEXamDuXMJOZ6hsrENR0QCkA0VGcaSKOnZqkeR26c8h94NAM
         n3gA==
X-Forwarded-Encrypted: i=1; AHgh+RqfVS/nCxspFELTQ5g58FFM5JbLA7VqvYQLcqf/c7kKDHefm8dsg8wkdI5aHQoAGQ1i0F4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyElvzZamKFDt4I2FgZVdLI4rsZ5aAqF0N3e/Sg/MQay5aXf3LP
	IkBU0nwEF8gHVT8BLXJmwJLSmguN2CVZHjElJiRUbZgcmH/0elLSPa8I
X-Gm-Gg: AfdE7clU+W/RrrlCaIJXOUXgN5lZRIZY4Yvl4dmtM6e12r9d7ovluRCbLT7akfvZbFV
	Lpa0N4E5uicKP0CoiWCDm77XzpZZvrkdz140LkFxrvDV/OXzcFSTFFFJey4fQD+JElM9OKRIrLO
	baYd6DPWmNAPdYofAtodQ2JehLuMGD9y3wY547CmM41o78O9HqB75ZAbsVcF+fM26vRmng7DmGn
	ZgyLrWOPpVocsTziPX8ObZEAJxjnP3VibuUdWh9Lbj6galYxfJio+Nqn+NSku3/1gx9zygs8cyJ
	drzlDS/Wwxuz+aJkvtfsf9QUnsw4FNxE13vi0S2v5HO0B+f9cYgH9DiwhhDaJHPelSxZoLPb2iK
	hvnge6/bNLlUL7EageSSLia3GYIQauSOoR/L3uUj2gEwB1g/TtNOK806toe1F+n/zxylV4csZnU
	2o583OSg==
X-Received: by 2002:a7b:c8d3:0:b0:492:6113:d4fc with SMTP id 5b1f17b1804b1-4953899c37bmr54386175e9.17.1784127389264;
        Wed, 15 Jul 2026 07:56:29 -0700 (PDT)
Received: from avermoal ([185.13.179.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a322c86sm145746985e9.11.2026.07.15.07.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:56:28 -0700 (PDT)
From: Mikhail Lukianchikov <avermoal@gmail.com>
To: lee@kernel.org
Cc: avermoal@gmail.com,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] mfd: viperboard: fix native fields type in structures as little-endiand
Date: Wed, 15 Jul 2026 20:52:44 +0600
Message-ID: <20260715145243.461827-2-avermoal@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse reports several warnings about incorrect type in assignment
(different base types) when building the i2c-viperboard.c driver:

  warning: incorrect type in assignment (different base types)
     expected unsigned short [usertype] addr
     got restricted __le16 [usertype]

The structures vprbrd_i2c_write_hdr, vprbrd_i2c_read_hdr, and
vprbrd_i2c_addr_msg describe raw USB packets and, as I understand it,
require Little-Endian byte-order. Therefore, 16-bit field in these
structures were annotated as __le16, not native unsigned short.
This satisfies Sparse and ensures correct behavior on
Big-Endian architectures.

Signed-off-by: Mikhail Lukianchikov <avermoal@gmail.com>
---
 include/linux/mfd/viperboard.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mfd/viperboard.h b/include/linux/mfd/viperboard.h
index 46287a1f6bf6..5761ebdc81b3 100644
--- a/include/linux/mfd/viperboard.h
+++ b/include/linux/mfd/viperboard.h
@@ -57,15 +57,15 @@ struct vprbrd_i2c_write_hdr {
 
 struct vprbrd_i2c_read_hdr {
 	u8 cmd;
-	u16 addr;
+	__le16 addr;
 	u8 len0;
 	u8 len1;
 	u8 len2;
 	u8 len3;
 	u8 len4;
 	u8 len5;
-	u16 tf1;                        /* transfer 1 length */
-	u16 tf2;                        /* transfer 2 length */
+	__le16 tf1;                        /* transfer 1 length */
+	__le16 tf2;                        /* transfer 2 length */
 } __packed;
 
 struct vprbrd_i2c_status {
@@ -89,7 +89,7 @@ struct vprbrd_i2c_addr_msg {
 	u8 cmd;
 	u8 addr;
 	u8 unknown1;
-	u16 len;
+	__le16 len;
 	u8 unknown2;
 	u8 unknown3;
 } __packed;
-- 
2.55.0

