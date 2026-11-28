Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880123;
	b=GlL2zZVbJMgPNHuBkSCeZzrFnGoQ2E5ynTyULlqYskLdmDKbCmf1qdKrVoCSmIHwnXOw
	 fVC6vAWGW3TcS4KJmgzZ+JDYPfhfC41yfQ5jAIQGpAvC+IiqXMybTWpFeOeP2eUzizBRi
	 9xYksLKwNGNdFT827CIaENPfCTgNhBIO2SLHUFY9LXIQYK1fN0fpOVpCuhcbtiO/FMZtn
	 2ABlX/dbr5ZSW5tO39TWg3KP4VR3gfTljLOizHYgHa1CwFm/Egdi3WYOXe43A/PEFE/Z5
	 Awzw7DDjUwpyLeQiZ43TbxCaAEHeXyssG+dlbLFFYEhQjyo2hDcW5qkph6qJ48aMnWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OPDZCl80ucoRcFw+rfeWFDnofPgw+y6THl/lFgLOQIE=;
	b=1QcH4ECGwWXXiK6tpIpBWq+7pkyQwPRx9/RIgd7H6MyswCJLFDYlXXnSgJVfl6L9Zwd1
	 U4FVkLK/vTyRrWpGiVIMFBSbjucFssH1qj1Z3gfLVW2uYWH59lBIn+Ebd7bjLGPJWtX/m
	 L2rV46WTCziHp6NMlRUXpzKJdZ10OkSKmsLwwz2J/KldmfE9YZcOTwSO1S6p+r6N4kOy7
	 2Z2iNx6mwnCs3Ev/8OrnMVrMNn+gY1kqWQ37TqGB/V2XIibwdCuU8LzzUPdi1Oyr/g+XA
	 buFSJ/9N5sM7cEA7BekTpMPA713EbzAm+cgYHasIEkI+kUT5aWvq0o9QFeNkTCbXYlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdFLgQUv;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACDB606A329
	for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 15:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ACDB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdFLgQUv
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so114987195e9.1
        for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880121; x=1796484921; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPDZCl80ucoRcFw+rfeWFDnofPgw+y6THl/lFgLOQIE=;
        b=BdFLgQUvKDiyC/ZY+tVlckGFMztAue3wzN1Q6vTJiq+IUnlzRqWZ8DOjiNEtNlhc/L
         o7yA0cD5HzzUr0EXrkHSXEZGuRwKxz4TbCkVT61+O3srDzppWcMEaunCtCuo1ql5Z3cN
         5wDrcLA3OOLuLAgRP19fEqMXWGI2n6VCJImPTbfGNJk3B+RRIiMYhgJ/akjJSnWQpFJw
         DasCFZERqJlL6CQU9HP2/Dr0f71AGPAkZWNYlN35bF93Vse4Jq4FF2aWIFeNS8AlV8/h
         6n3A1cNq7LmXljHPRaNzbXmjz3RpUnoYO/slHOaLN2uY2pM6ev6g4Pq6a+mfwYOHYptZ
         kibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880121; x=1796484921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OPDZCl80ucoRcFw+rfeWFDnofPgw+y6THl/lFgLOQIE=;
        b=uR0048npQafAIGhtpVciQzw4rHHH7ClBuUtZYmeecRAMRm9gtAlrNxp6lRcKQ14mG/
         hnq1Mt+swaP3te/Qn69fnJ2VLDczWCu3zuk72YSXVCYjaO2Hs00Ll8MEuGQF4ltyHar5
         CVJ01clZ8KbK7TLvGd/PxyxZ9lSVLqvgVLln3DozxOR9Z1tj1I0W7nbpB8BhcxstiSVx
         TLJ7lvaGbR9k5dyRpDWhiepWKGYMvXrTU0YvTwXL4rwop5DHISiK27+X59qEUlDjTZi2
         WegqW7KVR9RqqxugOvjw6jMSnbAt2dcGFcMiQ2aXmOTxm32PxIXVK/vGAHgYoNgl3BXL
         aasQ==
X-Gm-Message-State: APuU4Z+X1TPWfBM2YrOvQtRtqVJWIhTJP+Czbih364xstJ6hAx1UYeDh
	B2fp+JU5wvoezK24sMj8m3xLbvIVKxCiUMOR738bh0XfL3+l2hHAv/mI
X-Gm-Gg: AZFdTZfTzidz6j+waUhR9fjt/1SpjBo47OItnn7vqPHGPmJATliTstiDvWLUvi+x7Od
	c7jusBVNMGyZgP7WVXFN8CXpxTmk0U5D96lNJr4GtuqFoaYztmVdpndEoe4/91XM+qqb72oWQM6
	zsp/Vmbv5glxG9FRWI5GybYC41LK1epcUy9QnWUwgywnWic4ez2apf2pV5gxl/8P1nA/lwJB+Ni
	TjMpgOHVe7MiLhr9am+iV/lpLTwF9vByhirLyMz6dc+G/3CRvDAQCHAA5XlN7dJ6jRQPyivoWRB
	/i/mFCjHqe/FbsJ6QvrMiqgzRXvIgfgBYIKq7GeNeEGCSAjWJuNEs24f02pjdcnvbC9bG9SoNft
	xnusQJOUh+ZhO5lfSroMtqGoFCuoZEevS3gxhkXPPtdNsSiRfsWXsLXAwyZmJJNM3Kt6OeVFoVI
	YYU+3KJPFUvujv4lBiqi1vRgHUIDQDxb84/0MyyKFYvdGUziSzWJQaZwxeEtl2xZA9boTkCY/TP
	CCsV9iteoJPWLRaCPP37kNPMSJd7Y16ICY9EtPG6jdW4hmUQb4dFcu20lA85Xr9aY86/VCPHjlu
	vITVoOPYc5SW1cIZBedVFeXcHJdMfSfxUZuJJrKR
X-Received: by 2002:a05:600c:4e0b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb887fb66cmr593468135e9.5.1795880121168;
        Sat, 28 Nov 2026 07:35:21 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:20 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:34:57 +0100
Subject: [PATCH 1/4] mfd: tps6586x: Leave warm and soft restarts to other
 handlers
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-t20-soft-reset-v1-1-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=FHhG5PpLJ8sBoWRAgEyavLjNn+Vpbum5Z4mXHlUvn24=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl63uaa5fTqyS9o1cHizZdj2/KkBUbtHh5O+VJ/w+l
 RQndSZ2lLIwiHExyIopspg9FPrCM8/r/YaXWzth5rAygQxh4OIUgIm0zWH4Z3+xP7ZLvNYjSYDr
 zGJjjnPXr+lbHvVrZeWKepPeKMCSzfDPZrZktCcHe0KJy4/bjx69L58vn2f8V6Cl+LHj3OU1Ndl
 MAA==
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The restart handler resets the PMIC, which power cycles the whole
system, including RAM, so a ramoops/pstore log of a crash doesn't
survive the restart. Its priority is above that of the Tegra PMC
restart handler, which resets the SoC and keeps the RAM contents, so the
PMIC handler is always used.

Let the reboot mode select between them: return without resetting the
PMIC for warm and soft restarts, so the next handler performs them.
Cold restarts, the default, keep using the PMIC.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/mfd/tps6586x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index f524bbdc8f3b..a92a88ac987d 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -480,6 +480,9 @@ static int tps6586x_restart_handler(struct sys_off_data *data)
 {
 	int ret;
 
+	if (data->mode == REBOOT_WARM || data->mode == REBOOT_SOFT)
+		return NOTIFY_DONE;
+
 	/* Put the PMIC into hard reboot state. This takes at least 20ms. */
 	ret = tps6586x_set_bits(data->dev, TPS6586X_SUPPLYENE, SOFT_RST_BIT);
 	if (ret)

-- 
2.56.1

