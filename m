Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793070490;
	b=uEYnYPfV4UD1zy+gsfkCeV+LJPaQJheN6InlfXMbFr/kAbC1Hv7HmLI0RoEPlDsmk573
	 8a92aneqtDVfk2pFl9CGfRnKka7Z6YW9ocXMiGunlrBtS29TrLx3HrCpqOfEOs5fX9nf/
	 nQf88aMdgxyF+k2oC1syZ950re9RqI+c4TtORU4HupuTab1TSUccrZcCWkeRZVFJXd3aG
	 U+6O6cS+rG0hsqU1G2P+L+ph8fKqxosXLZZtWunq4aAtaouZ/a0WlbLIHTDhx8zWJGRu4
	 6S2fp2FJzJFOhDhc7O4vl/3tHAIhBAoRtMoqd8Jb6NHr60Y1cE/f0jsKDsCCK3/i/kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=igNgupZEn7aKjw+PjHHDoJ6CuNjmPliTKlApfHrxbJo=;
	b=O93/IdAupuY/BuXRBvL6SOHCe9UZwg2u8iEwANIT7dWawzvY2/Xyo+CpsuvpLiwrJE3y
	 voH0Q5LQsK6z6Jx3Bsm+L69o3cCcgwG9uYgkis5LISrOx4emTUZgiJchwYZnPFWOYlrE1
	 DRaSm6xIurAJVZ0rohefTgPRqEIqA312p07GQVAClB/u8qy9LKav1PZvHHDjMA8d3FHnp
	 M8W7nr7DCZoRqOcD5+eKyBi3Z+TcKosv53w5UgACJ2QGLh3+fo7PHHwqV0Gz/+IKWkyTa
	 MK1jY1g21kyVkC10lKctV3/ugzP9Haz3nUi+Ts382KhsweM5jHqkhUEglCidjLkMQIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gbtvgpMU;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B7F606A31B
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 03:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B7F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gbtvgpMU
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae0852df46so387940a91.0
        for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793070489; x=1793675289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=igNgupZEn7aKjw+PjHHDoJ6CuNjmPliTKlApfHrxbJo=;
        b=gbtvgpMU+PQhYYe29dp3RAPRsCujMatcTpDmnX/SU93rDDhJQrJx4zcPEPzWxfFWnJ
         unzB8ccvyC7C44pP8GaGuBDTRuWhYVQ/fkNwlOg55EuhjJxLy7HUpt+HdNavyYurpRfi
         LyHJ5W3F7RIEWuShoWWnOtYN/4H61ol+uLhzTTS4xhwam4LAULe80v1O/Rp1m+5kvewk
         xdJDjHxJzk4eNML24dFfXEThhFqklfHIksYMR8fL/PdlgFAovbAP+AZEpizIkFjqoiYy
         qDsoDxfZ4JQ7XMxLB6vG5R4t/DVNUX+/o8FezWcJZo8qS5QnEthNtoZLSP3nF4gH8Ti4
         9xeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793070489; x=1793675289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igNgupZEn7aKjw+PjHHDoJ6CuNjmPliTKlApfHrxbJo=;
        b=XcsF22MaZ/ZynEnlarQJwI+x5N5Kj03s7PmG5YEr9o3KbPm7mu3V5XSCWi6uqynXeX
         44j1vwSoZMOt27VduFe85b2vF4St08FI73lb5J6mxOZ21dr6DYTAzOF4oxY6v6a7Fmf4
         tZV9jwiHcMGN12JCHd7+QNx3W3bkTkawy8RH9K7XiFebpj5wxk1JfxLNl7+eKttFyzmi
         oGdCqJvuZax3MEd4i/ptPqyaHhA+ctr4e9eHA9mqwleI3+YgjG2LGt2KdT7EW97wVk6n
         xDkd938kq+Hcg3ZL8/HwF2IVzpthxbly0rzWtR/oPeozIc444cEI/58nFod4S2cg55wx
         v8rw==
X-Forwarded-Encrypted: i=1; AKwUvBwOV8DYuMzEUyMk0jjrx7FQy3ddrrGRfAgrTSxKYpTyN35gLaI2e9wwKY/Twk5zGX2nu9o=@lists.linux.dev
X-Gm-Message-State: AFq9FYKfwhkfkVzw7wzSumElt9PF+95mi5gJZ+hhzK1eiN3DM87iM/Qx
	08+ZIswT2F8rpSw2pcAKJlT2BZ11JZTFUk3YskSo9WMRKLCXuFqr9HtqwkVWqSHwAUw=
X-Gm-Gg: AYBFou39ZjXSRR27D84k4GtgrfwuliPAFNGYN1i2r3Z6qucNfYQG1yg4Qe2VI/+LkR4
	ewidQ2lni1d0FP8+gFuib+AzLtAHIaLkSpAK+a2D/MBr8NQjlDV6AqCSo+slYuM3cQEgSRFaraK
	abam37JcXv1A8svbE/z8vIowk3DJhBd337hp7goYnZj4ruyGdDgzC6xqyxQBnat+DkDYlY8Ps2E
	opY+rAcozhNAtFvR0IwLwnswlDUE4Xy4OPj8m3ILXYeyQUz43pDoS/Woml9h5whlMaOqA0GgH4w
	LpEn0hel9Y5ETHbiQg1p2r6R5NatO3A64LI3E+7RMVnBqEptPUCLfwxu2+K3Nfeb9c5wW4v2PDm
	oRQtGE9H5ZyGMDQKHDFUCBDCp28BFXZYyq4eo41Z7J9/+5mqIi4ssIvdCG6WpQOq1KW+6krUVWP
	me4jzYoE7fLU5IqYALOCvfSq198pKVqGWSlpZLJbJKapz6XD+mA93S78tusHKhJIPtKTUtxhKwB
	xQh2ZEwzuLSbpQD7Cq2kPbHQL/0eaKPH5/Wv7YYOd1W4LJ97zmXdQRfHEj1oTGja5UGzMtKRPhO
	5omeVD9ysJtUQN18x5Td2iDLkMM=
X-Received: by 2002:a17:90b:3142:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3ae40268bbemr736527a91.8.1793070488963;
        Mon, 26 Oct 2026 20:08:08 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebafacd4sm5767362a91.2.2026.10.26.20.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:08:08 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: da9150: fix IRQ action memory leak on removal
Date: Tue, 27 Oct 2026 11:08:02 +0800
Message-ID: <20261027030803.118131-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

da9150_remove() currently removes the regmap IRQ chip before removing
the MFD child devices. regmap_del_irq_chip() disposes the child IRQ
mappings and removes their IRQ descriptors.

The GPADC child registers an interrupt handler using
devm_request_threaded_irq(). When the child device is subsequently
removed, its device-managed cleanup calls free_irq(), which can no
longer find the corresponding IRQ descriptor. As a result, the
allocated struct irqaction is not freed, causing a memory leak.
The associated IRQ thread also cannot be stopped normally.

Remove the MFD child devices first so their interrupt handlers are
released while the IRQ mappings are still valid. Then remove the
regmap IRQ chip and its IRQ domain.

This issue was found by our static analysis tool under development.

Fixes: b8fce55c09d3 ("mfd: Add support for DA9150 combined charger & fuel-gauge device")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/da9150-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 5c59cc869fb3..1b6dbbed60e7 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -474,8 +474,8 @@ static void da9150_remove(struct i2c_client *client)
 {
 	struct da9150 *da9150 = i2c_get_clientdata(client);
 
-	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 	mfd_remove_devices(da9150->dev);
+	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 	i2c_unregister_device(da9150->core_qif);
 }
 
-- 
2.43.0

