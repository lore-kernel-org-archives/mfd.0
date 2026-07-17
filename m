Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247473F8224
	for <mfd@lists.linux.dev>; Fri, 17 Jul 2026 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290284; cv=none; b=Jq3STZEW02bJvvPGHDdjC6mBZh4GGXMBsRMbfCv1sJjICZIe/1a8WdxmD7oiJwsomSwwUAuFbHpetWfCg5DQg/pP9m4c86AFAGXBMtYQlsrdVil3KhYcNT1Bx5UT1zrhfRuASEta4eAcBES6q4yhAIYpeFO4CNLslF9Kh/wDqK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290284; c=relaxed/simple;
	bh=Xq8AHprMQkizKaAz69a0lJYI+mSnJ5uhq/8mlIXudLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=He/qnGrkLN2z2v+/cpGG7iCzzgmTAoQ/hqOYHizd3X0zOCTvEIAufJbuChxkAMDtqDjpSlzoskwLcr4+C3N84RWt6rKjrbuwto+FH+vRyFL/BTG3Q+WTXHWS1MUsiiAtXwV7p+iKSkj9NOZf9FHgFWg7GPJMN8fiP73fu5wsQtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTrzkInm; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTrzkInm"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4720d22c94aso4858828f8f.1
        for <mfd@lists.linux.dev>; Fri, 17 Jul 2026 05:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784290280; x=1784895080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLryWq78DU+y3cMTI0vxkxergzF9apv/QthuDMoXh4c=;
        b=VTrzkInmCHl0cR/Eo5i/XKejKoJbyGwhkCGQq0IXflyhR4lbNO7YiP/heQqfnx9mkQ
         kzgblwJM5h52U9Qg8fe8nOSnzXqkQ9LJ0/AEAmb8SxM7758WEoKcHX5+7SZichTkKtbc
         XKYiZptCJq4i92eo4Po2bziJ/mHK1V9C7G8AXw34nj7mrcMjvv1XUByUM2w3TlOhokum
         hMym50NcBDFQoXHm/82PAKdKKAmM6ICkXFMio7uBwaUJ49DIexB8ZbesJusb/Kn3O6I5
         WOqLOgdZ0WK7OmiqaZ6UQHPUrq6YX6S6YV3Kn+5o/XyT4hj6uoDfk9Tpf+FrqkorkEbZ
         gcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784290280; x=1784895080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLryWq78DU+y3cMTI0vxkxergzF9apv/QthuDMoXh4c=;
        b=DKi8/woXJk/2YeC17CPlCo21wrMFfNyT1LGMkyH7XqVEa4n3OB7Gw5mgBihvNxGqwQ
         qyrlbJQdSXekTG2YvCrIx42vBKp1iIu1vpkB7HJ/dXAHECUvhNdSHOWnFRPwRLbQuSsI
         8CxJe6CZpLzHIoJKlfHpBcRZWUvyjMablZpp/rYXzolb3jpyJfc+VvgA8M278myemcVa
         ci8TSq4Pw17q81m76rCDcdPZoXcg94j6pZSKHX3kQH5qiJJDma8k/holfNqv36vdjXWR
         FdGHs1Ia1P8Bw2RLT2ThAg++y50v2xX0+QTb2obZPtbxWa464Crwwp8tKCx1To1T7KTR
         w4Bg==
X-Forwarded-Encrypted: i=1; AHgh+RqqgA1FgwgnAGuDBU0p1/PEhs8Qo+ecIAfiqqrmvldc1FN1MVkUqA+usfvreiMx+LvLP5Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzN8QM4vYTG5GkQ2wMprw1VXveUV9UCAfV00IVcs1yJybnU1glu
	YagW4SBjb5B4IY9flsw8JB00aYzJy/I/yjsQRQBooRsH/0NEm3T+hUyf
X-Gm-Gg: AfdE7cmXtNaOACQ1duU7XRcMU3Lqubmecu34RjDiNmzZwkuw0ZBNEBb/vOMOI0+xcvP
	DxMQFZpkn9Cy5x7QVRDpZqGIPxm4UAGHcMcGjRFE5F5qx4/35PXvWZbtAgfD2jXeTsnFPo27MD6
	QjIJWK+1ukjU74VkD3neVVxsdZp63vDONt5VSVh2P+/i8pyyltlYFxr9ExAI+LZiwbN9mbgMqRG
	kcPvg2vve6gwHqc2RGMdnNyeMF17GSHcl4jEnZyz56L32mLtROVNCRAJ5Njv/NvYuVOWQ1kk5Zo
	ln4m9r/rgJQFgCq7LIwCXi94rAMVNxqJVb8Tr/nBjlsW8QwT3KGUZ+qWKO3nkIi8iXsyWzw/Fk6
	bcovfZlfFvwbl8V3YrYYk2dgSCDrXmNT2ilNhebzV1g4ThEJtkd0C0sdDKViPiawvvbfG7w==
X-Received: by 2002:a05:6000:2c06:b0:47d:e121:1dd1 with SMTP id ffacd0b85a97d-47f622f91f8mr3793277f8f.17.1784290279983;
        Fri, 17 Jul 2026 05:11:19 -0700 (PDT)
Received: from avermoal ([185.13.176.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eea8afsm3528103f8f.33.2026.07.17.05.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 05:11:19 -0700 (PDT)
From: Mikhail Lukianchikov <avermoal@gmail.com>
To: lee@kernel.org
Cc: avermoal@gmail.com,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2] mfd: viperboard: fix native fields type in structures as little-endiand
Date: Fri, 17 Jul 2026 18:10:16 +0600
Message-ID: <20260717121015.11666-2-avermoal@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715145243.461827-2-avermoal@gmail.com>
References: <20260715145243.461827-2-avermoal@gmail.com>
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

Added missing change.

Signed-off-by: Mikhail Lukianchikov <avermoal@gmail.com>
---
Change in v2:
  - Added missing change in vprbrd_i2c_write_hdr structure.

 include/linux/mfd/viperboard.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mfd/viperboard.h b/include/linux/mfd/viperboard.h
index 0557667fe544..5761ebdc81b3 100644
--- a/include/linux/mfd/viperboard.h
+++ b/include/linux/mfd/viperboard.h
@@ -47,7 +47,7 @@
 
 struct vprbrd_i2c_write_hdr {
 	u8 cmd;
-	u16 addr;
+	__le16 addr;
 	u8 len1;
 	u8 len2;
 	u8 last;
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

