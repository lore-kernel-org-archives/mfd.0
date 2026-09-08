Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC4B379991
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 05:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846826; cv=none; b=PCDKjGtIEc/WWcZu6mrRGWQMHtHzpa8YnzVw76i5E4/TC0o0qMQ8ScvS1Tw/vL6cNY+vuOHoyYKln4R3qfUTfjIk1y0HHzal2jNZytU5xxd65hP0u99ze61ipf1LZwP9BIPzSyRs9ep3QHEL0eIwByWzA7L5HEPKGCReOfIeZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846826; c=relaxed/simple;
	bh=Jz7PTSKGJ55NnLyUAIe8domyVhPo7IY8b8In90AwBXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LLN8zw29uZAcI7XxRFLdHzdQbfZ31rb2Owp/j49G9QKMUjFQq+hW8XJhnCbw6tIQ4et4L+TdmPWz9DHQQVDH4ntxIWcTbARplzJuEixuGuM08JUhTI6I9+j0AO79LUsktycm/eMHwqQSEvM18u0vYn/y9hhtkF2KrfU1U1o2XSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvjR7tIK; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvjR7tIK"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so4295616a91.1
        for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 22:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846825; x=1789451625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAY8TY9q0i8zWUjXHOr0pnr+Oz87HVu+4vQWB90u+IE=;
        b=hvjR7tIKj84Dr8SOPdo5OUJG+I5O+JObzB7VJJwPOwxn7bzMMeueb650x/pwjCZGXy
         ZlFf7wMfGeYWu9yTB33ozBfd8csLOQUKdq2J+wdu6OxVXclfWk0dBa+KaWHmpKfCieAT
         uAp9eRIZHM9+hjohKl9YMYVtXWM3OKQNCgy6B8XEqXf6vRYj9S1TTybXtRs0WA0BEavS
         tJZGahLm7yHAyOu6XcR8etyPwN87feM35Eszn59QsSLHwOk1/Af5AqtXBhouYe2bhhyz
         gZNLtlaRJVkQXANxGcu9LlCu/bGzuiPPeRF43Ohn8g/E3nx9z5RR4/5I59Q4/0QDFLP6
         MSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846825; x=1789451625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAY8TY9q0i8zWUjXHOr0pnr+Oz87HVu+4vQWB90u+IE=;
        b=PdEAIpTElboDVl04XSSH8OMqg/sPFwdAZWtuGxl4aiVsJKGCSDS6moJxoF6Y2EwXgj
         pD8/jyNMsL4yVFRQnHDgFixh6jxzFwptBJNd+VSLYwEuHkhlkbtGFL2aVg2gBYs7K6fz
         y3kVZfUZIC9+HBu6zCcS4GO0VNNcpxJh6a0zCuMfHn7EhNGVHNVmdnsJShWVDQWsewPr
         L9ASRw93mvfO/ePs1/gMjW2ZYO41OITSgaNEG50KwTALQYLprWb3EZKDJ9bvjpsCk5tX
         ZBIQM8NHXubEaqudUfX66Lnl41z0BtffAiMmk2NNjgLqUILdgYQcWjzbKNhmiSg8s9FJ
         thwQ==
X-Gm-Message-State: AFuF++ls+XImfjDl3Dam4bGf9mYjfPbIx2CWBZO1qR5eUjn3Tk/xEuZp
	zX7eAHPkMhnM496XsopxCQzho7LcPC9wdwGr2rXAIE5jltn1QOZUax+T
X-Gm-Gg: AYBFou1dTE73c7tXNBvoTEni7KVPvDqupeI0BXKVWHJKN5gk8kWHn/HVOpmK2NMvxJT
	c+/jCGGqMohMP0JLx+RUaZac+D4XHYJbdMtL3kuQVTAsnNHKdly+IpDConnpK8/dV2pcm9s0IcY
	mNZFw1SqW84s3Qd00DVJO/u+Ferscu9+9OAFBU3ThbRGXiF707HEldrxr3weHf+E9Zr29yxE6FZ
	h9VOUVjZ3APdMrjgjuRstIswuGFOmwFWeYm+DFVRW9LbDqKiVDoS16zZleVFjbkW12QbmoeJTra
	Oj5pLto2mu3qDeWAjjE6py9Gt0o4HCGqN5nIO9QDG5tAWq8eR1eA1YuF0OSd446vple4gfEJPf+
	rXFbk5UnDvNyKfugDgc2Knev7hs+PrMF6xW7cxV6/k8oFUMdObZFVla4C4DQRxhnWKyjAgc6URj
	Kynn3QzGmYA6lSlHuBmh5DdeDNJyl7oW6WsCABgFsIQ5A1+05jlhkWKor/pQLoHHg9kk/SzD46q
	/H189EbiuSDmQ==
X-Received: by 2002:a17:90b:1c8b:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39b26214502mr37996095a91.19.1788846824454;
        Mon, 07 Sep 2026 22:53:44 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm32427231c88.12.2026.09.07.22.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:53:44 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>,
	patches@opensource.cirrus.com
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mfd: wm831x: Fix typo "convertor" in comment
Date: Tue,  8 Sep 2026 11:23:40 +0530
Message-ID: <20260908055340.22241-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "convertor" to "converter", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches a
comment, no code changes.

Since v1 the subject carries the driver name and a capitalised
description, to match the MFD subsystem convention.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Changes since v2:
 - sent on its own instead of as part of a cirrus series.  Mark Brown
   asked for patches touching different subsystems not to be grouped into
   one series when there is no dependency between them.

 drivers/mfd/wm831x-auxadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm831x-auxadc.c b/drivers/mfd/wm831x-auxadc.c
index 744e1d161c5a..6280d4f38981 100644
--- a/drivers/mfd/wm831x-auxadc.c
+++ b/drivers/mfd/wm831x-auxadc.c
@@ -132,7 +132,7 @@ static irqreturn_t wm831x_auxadc_irq(int irq, void *irq_data)
 			1 << input, 0);
 	wm831x->auxadc_active &= ~(1 << input);
 
-	/* Turn off the entire convertor if idle */
+	/* Turn off the entire converter if idle */
 	if (!wm831x->auxadc_active)
 		wm831x_reg_write(wm831x, WM831X_AUXADC_CONTROL, 0);
 
-- 
2.48.1

