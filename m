Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794278014;
	b=vdD2O1nwfPbjOtH83I5XKK7Mp9p7B41J25VMxFKv+8JWpn6p3mdmAp9ih7Gj14ZXkrfb
	 JeGXvDh4cVI5Tn6ToMyffSg2PBUb9V+g96FBUleoZ+vAUXwvRXKVhxO+0Z0+xEoLED2jH
	 zOrbOeRuFUhbXuPNCxGFVF13AHlbHy5dQBDx1lKFtrERdIzEPZ0MjpzvYeVeg1iccsEzh
	 fnVFnweI/zvpqhU4LrutgAv2Qhtj5pb7bh47B+etZlXxUiBP8DonqrUJJMmA97Z/UC3hB
	 CBpldRy0dbEuQhyI5wc2av+VZolD6L/QorwXpBHwd6Edx9Q+EwgMwqQilBZS19YZqyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ir6+0LktXyNV5hGF4yG0Zsi8r3P+hNjzS2NcO8JzLHM=;
	b=kzFdU1H5sBM2jjO/ABRi5kXtqdsCA8ZrwYJp6ebA7DVVwuHIy2Ypez8g6CO24czyiS8j
	 fomQ0eMPf0XnhhSMY+CJ9d1BiTtSGDAMcUdvcVGJe9HGqywVluqWXO+vpguOkhTrHmVw7
	 BkWEmIeAyZxgpoV5eKSbcDqtMEbdAnyrlmd4ACSuzOiMvCM5Z/dhmz/3SjA1C8YTLFq6z
	 CeJEOOk12jp43+sv56xG9aJOM78Q2YFVD+Xe6ic909V7QDkgzq9tWT+nj6Ojso3Rmg6iM
	 TEpAk1M7dMQsng+Xy478W5Nk3JWqO2Mr1G/bFMgJEcAl+s25jnUvyw4VRJFd9WhCbfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFz0kdzX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CAE606A326
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 02:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00CAE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFz0kdzX
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d21051042so235951966b.0
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 18:33:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794278012; cv=none;
        d=google.com; s=arc-20260327;
        b=V4n1sZ4fByOupXCYleiCAGsEaO5stGtT62PRtyrrDGRP+ILUOVdY1cq5sGwcmgHKWc
         cgBwj3G0MBg1+kyLyb7mdumn7msoDlmL2i3qinXwlAPwy4jaj8Kv5D3m6FSs7CWYIGL5
         ZyU5eKLjX8kgBFVNmr7MwPFt2xm0rdISDJCzxam7ptOIxnYHXeP/FWe3A99hx4hXUqIY
         JXFK65aXsaTJjxuG2KBNwZyHKHt38FD/FjGJJI2PlOdZM2OK6QDkY4vCusHzjYJgPbwU
         T6rBkIzpQuxxUUoGXsG6labZ3SMbEWBTyJNnZbGb54Veaxj0a5kRe7QzgGsLXgSjSzze
         yPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=Ir6+0LktXyNV5hGF4yG0Zsi8r3P+hNjzS2NcO8JzLHM=;
        fh=LfwBVHw7FFnbPqnlmSJG2W/JpGkN/hcc8HspIfn9Lqg=;
        b=AC9suu7wwTaIDGRlIxjri+yFD3Elhtx0UBQ4AZUCkaNJSQy0UVk21hI4CaWc7b59DI
         hKsrRmJpaJjp6RjuI72v7Zc8b66nILtY6Y7HigA1Ott93OpM1tDtsvRaS7imzqCRtLQP
         aaj4GjGAyYl6lyEqaPOhRtEDyASGwIf2OZQ472jnG1hSTs7aijJ1QnK0M+zRonYgBp9H
         Pb6VTkwnkWQxtr4EEUIjcWNrPwM0xcC5+kgVVIhUmHodkoVLcSUhL6LYEg8ipd7/qJo7
         uNkvZe9tWSxOb4trewgK3uqE69GxwgsMFjsIV+lHuyVegPjYeZ5BBNMKMi8v0AsrT88G
         4jLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278012; x=1794882812; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ir6+0LktXyNV5hGF4yG0Zsi8r3P+hNjzS2NcO8JzLHM=;
        b=vFz0kdzX8zkFBFqCQ6gDRkhtUXJioikMFuxlSXTfGor5zJVli4JXT6LpXj/LyetDaG
         hTfqAkN8iXb3ApyX5v2a0/Rns11/ydXvfTjYI+FD3vb0O9SnEKFtGtgkHxKbJWsW+PX7
         R1PeQAX0MU510szHgvKRvD/fAIL4k/Umk3WbZuRMAeIyWG9Tj/BX0QVpP4phBTwMZU5t
         +RaYQumSj+2P5oDdnNJKGBqvUjRn+pgGvym86Hqau4ADsC379JE4+A+h/3pRYEp8kwI1
         AiXeHzAs1bLKdwVPvoC3IQ59567zgDHuCZArPGCmoO4BzDDg71mKKcgjaooOKpGDBTgO
         OQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278012; x=1794882812;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ir6+0LktXyNV5hGF4yG0Zsi8r3P+hNjzS2NcO8JzLHM=;
        b=VRFXkDOfDpRql/G3zjpMZDvXVpOctRPUUGeEzD7xZPigkPXXhw+XoI3Ega4IF6cENe
         qvmhCxqijBSr96qhKFiwP0M/eykQhZUsYffejzWp75HldwgrSabdNAm++Pn7xwCNG0XU
         H3jKb76n3bSpUryzJ9c0BSjE+MDF1W6KXgxo/OwOF5WqPm1h88cjZKd2I5cKvzWaRGuZ
         tba/7L+4f4iidcjdJJvTU9MHHt7LTAa4pcV0OnsUFNPozu3nyoxveCBjHgq2kYYfw823
         lqD+qNGineDC6iy0MJRCAS/H75C8zi1FXQf/DKlslaiuYwUnu27qSQDg6EdASOa9+usZ
         ff3g==
X-Forwarded-Encrypted: i=1; AL+hErFet8Ta3IPgaDWolUnx4mk/yQA2VSrWbDEBBFOcAB2BzaTFJxNWkjDGq42Z3mt+rxBLzlI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8pzW3iIKP8/+Hcbz8oOKn2cNt8I/tZpiilcFnMb7l79br+gTQE
	lSr9BkHqvKsZrII86FkLB982AizuUidz+03/ycqydJdavJMCL/xxTXFOXYKwjQ5VoeyPD7EqN0F
	GjFXcQ+JKBsug/TOZ9P0tt3e5AnyOWbna
X-Gm-Gg: AYBFou3UxAHgNZ3Mm+bCexIi2r6jDzG1BVD/6T4Xm7rKTnxvsBfSTyjo6G91qpVAeM9
	8YH8ObJD+K1iMUHMc2wRAmeTaoQsWNLJvH/bxqgSWlZsGhBeep4AmYsBPZi7S51STeWj8Mr4bQK
	VOFKTVT6tVgvwGO2FcHT43OwRQ9jeK5BSirSwFwgSO192zKGRlT5mxEjfJ3V42bQdBN+fwAqsdo
	7lsB4wr41MUC4d3bCu4yl+g2WY28m0kzw2JW8YV5q60oP14z4oXy60tfcUuXe+e1OZ4iM+GQiAX
	5X/pwmt5XGtlZPR/LbdXMT7Zn8lNDFvj+d/w5wfXuU4u0XTn6/kGh2I1B8rIyZbZAsl0mQu1Yh8
	RCuuSAendd3XJcmgH+JEz6QvlHrYFQySlUOIbZZ4s0nIDiDX3XGW2Jphj5SyJhF0hZwtVe2OMkb
	clo49JDNzzrC/WsB0uKbqEf+xW+dscVyZNZKvp78z/rJllfXUnUawSJAiNsCpJzC5Q
X-Received: by 2002:a17:906:c150:b0:c2c:d06f:cf89 with SMTP id
 a640c23a62f3a-c50491bd3b6mr89682666b.2.1794278012315; Mon, 09 Nov 2026
 18:33:32 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 02:33:30 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8Gb=4JS4OAFKppe=LW6JYa2ssJ8APdJJX2Ou_BhzEvZxg@mail.gmail.com>
References: <CAGEsz8Gb=4JS4OAFKppe=LW6JYa2ssJ8APdJJX2Ou_BhzEvZxg@mail.gmail.com>
Date: Tue, 10 Nov 2026 02:33:30 +0000
X-Gm-Features: AclHuK8--TocW2ifUYfCFyXaag8s9F_8MyrCNuCPPkZVo7e4LGqYlTsfOEWdPSA
Message-ID: <CAGEsz8HEtP7c-JSV=LvhTH9k5uRxq4z+4GgypbE-gmCurghong@mail.gmail.com>
Subject: [PATCH v2 1/2] mfd: core: Reject failed IRQ domain mappings
To: Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Ijae Kim <ae878000@gmail.com>, 
	patches@opensource.cirrus.com, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

irq_create_mapping() returns zero on failure. Storing that value in a
child IRQ resource lets registration succeed with an invalid IRQ. The
child then fails to probe, and retrying its probe cannot repair the
resource after a transient allocation failure.

Return -ENOMEM through the existing resource cleanup path when mapping
fails, before registering the child. Leave successful mappings owned by
the IRQ domain provider, since other consumers may share them.

Fixes: c94bb233a9fe ("mfd: Make MFD core code Device Tree and IRQ domain aware")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
No hardware testing.

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 16ad4fd26..e00f31402 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -255,6 +255,10 @@ static int mfd_add_device(struct device *parent, int id,
 					cell->resources[r].end);
 				res[r].start = res[r].end = irq_create_mapping(
 					domain, cell->resources[r].start);
+				if (!res[r].start) {
+					ret = -ENOMEM;
+					goto fail_res_conflict;
+				}
 			} else {
 				res[r].start = irq_base +
 					cell->resources[r].start;


On Tue, 10 Nov 2026 02:32:49 +0000, Myeonghun Pak <mhun512@gmail.com> wrote:
> Hi Lee and Dmitry,
>
> This series fixes WM831x IRQ resource mismatches and follows Dmitry's
> request for managed onkey IRQ/work cleanup and MFD-provided mapped IRQs.
> The provider and consumers are converted together to keep their IRQ
> resources consistent.
>
> Changes since v1:
> - Use managed IRQ/work cleanup instead of storing the onkey IRQ.
> - Move IRQ mapping into MFD and update all platform consumers.
> - Reject failed mappings and unwind consumers before removing the domain.
> - Retain polling for release detection; the chip only interrupts on assertion.
> - Drop the previous Reviewed-by tag because the implementation changed
>   substantially.
>
> Compile-tested with LLVM, W=1 (arm64), for all 11 changed C objects.
> No hardware testing.
>
> Previous discussion:
> https://lore.kernel.org/r/atJycIEnUZKVdTjW@google.com
>
> Thanks,
> Myeonghun
