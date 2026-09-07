Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA1E1940B0
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 04:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756933; cv=none; b=nbY+c7UNB0v0fe9if2PVSW9Qiw8trYMzmhStEh5Xci8n4tQMli5V6OKS97GqnYP7F/OKkvyOMqtqU9J5421OXJujV/uaKn2Zh0VvshAULvYuSuM9Z3TlqkOIHl5GNRP+DGX7ZP7YzgLoG6n5hyQR9/MD2K4lQHvI95qOnCdodWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756933; c=relaxed/simple;
	bh=ucrjeC2hRJEEIZ6EHIccUwGf0DU4vAKej/No8MYuwHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z70Ey6aFb7RFs+SGbIMmrukcD2wv2ZzCj0ZpSL0JHyWDwKDLL2AoCYBlcOiDkjFRlO95WLTu0ht895E4Gs9ypW+SDmu20LlR3fTr/z+GttycfQ9nMten616c3SznKbaTrJHnBpTPTgzHBVSbcSx6gvnAIX7Lc9vLGvGKBJ/RCfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYe5DLUP; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYe5DLUP"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso2479919a91.1
        for <mfd@lists.linux.dev>; Sun, 06 Sep 2026 21:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756932; x=1789361732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q5jhlbEZ3qh8vQURGYIzWDz29UaYaWgBqWg0Y2URfxQ=;
        b=sYe5DLUPiHlNS/K6Hijbn+CTC0LL56/aCMXS4ZD3cTwb7i5YqDP9gfQ31tHJNqt6Og
         Psq/45J6ddLY+nbw1G15DUJ6icvYQcpmu5Bx+kEhIRPkOAVy8nn2G+l+Cfl8TDoiBNBh
         YTZ62Yz6gqsrWhD/GosVOsxljjBD7uOecXcnjbVh/QoYTrYCaQOkNUw41REL1RUGHltB
         6cw+ID+eTr6U51pjK/wk+t17w3T3F9dpBZt2OVCnvHMcqWekRhbJLeaQYcYeqWVrIbCv
         5YVaGcHgEMwM1oql/g603f0wX14F//lSLahE94tQc2+EYMYhVTJaHgB0DSEKr1V3J60z
         YDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756932; x=1789361732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5jhlbEZ3qh8vQURGYIzWDz29UaYaWgBqWg0Y2URfxQ=;
        b=HriNBtuHVJKx3nVgU/GrYZW2xhyBxFhD8LNW5LN03ht6Mf/MWS1ApXq6vVZu3tfdvM
         ONwBc5RLlVVmj6fDun4yMjHavlNGEq/Rpi9mvNd6tR8C15sg0/5vCAq9197xjVny6p16
         SJlXRQvutGPr+sVqeefn5SS/6wuw1btLrkOtq6QD7cKKf8gDA111T+4qjrTqnwKTTxcN
         hMeqXsoqF21VvgJyYqjP6dw8wklGu06ZZMopHH9PgsjWomlfgynZKMjbkAqHG290QnFJ
         EK4YpWuw1kUnvHqkVofu2BeZjFMgUiGmUzHgJmaVlnN4EkhvbwrIfAIdVi83iDZ27ZwY
         IxZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvHBTNReyziIAauIlL/n6NTcu69n92YTA9i/yJBXiuNMnnZh5kCiiCB9mJ2F/IUpSSotY=@lists.linux.dev
X-Gm-Message-State: AFuF++mby2IRHQ9FLNG7NN89SyEa94jb2bCQoKYEin7YjITS8S5aKzTe
	4NLpToXkKgB2T16MKM6v11rA78rOU/OLWLiMPuJfw2Q+M39tYrB1YcWL
X-Gm-Gg: AYBFou2Ts+kTmRT0mW7uEzUuuPYIeberDQ+obgzDDsi+xf9EJ/yZcYkYuPQTHlcMnIF
	FOETI0nxxifxKrMDZVWvTdCsfnpYhoD9qr16pzm2dz8hLYV/x9G23GL8sXDwS6w7JXFCG8BPj25
	pW4+V2CyU76lnp8PSsVz2RXucKxfupy8bMOgbFd6XVh75X0ZTSIPYZNnCnf+10KNk3NP2Ihwh+r
	2bl7mjQt7BjYvjBMYMHAJG4X65BVekC1meZDJGiFD/YNgOkAJABhYHbsxk79rvU916LwxS16cyU
	ZKZ2zLKc9cKDb+QH+OQmrUKS0gpuRzpShqDcud4rxoHWWmRdOQhTq5eo+04kjWQ9JmzAJbwFR/J
	g6bv8UVWP2YTzRy0OUO2yNSBcrDjAi/BLReoUc7HNmqn4EHryCfiGpwhBixbOioFm6OPFMnIDp9
	Px5JSaw29LqHAVkc97XwrDxVrvmUKiZeKHpVguEGCz6a1GTOSB5cZQV6bwhVUvpqz8r08duYHYG
	hW55lMndmccCQ==
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr32156369a91.15.1788756931715;
        Sun, 06 Sep 2026 21:55:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm22006422c88.14.2026.09.06.21.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:55:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: ab8500: Fix typo "interupts" in comment
Date: Mon,  7 Sep 2026 10:25:26 +0530
Message-ID: <20260907045526.18873-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches a
comment, no code changes.

Since v1 the subject carries the driver name and a capitalised
description, to match the MFD subsystem convention.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/ab8500-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 86fa99022cb3..ceea1ae34dd8 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -125,7 +125,7 @@ static u8 turn_on_stat_set;
 
 /*
  * Map interrupt numbers to the LATCH and MASK register offsets, Interrupt
- * numbers are indexed into this array with (num / 8). The interupts are
+ * numbers are indexed into this array with (num / 8). The interrupts are
  * defined in linux/mfd/ab8500.h
  *
  * This is one off from the register names, i.e. AB8500_IT_MASK1_REG is at
