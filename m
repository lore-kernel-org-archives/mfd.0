Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122341;
	b=XtCXwBSub64iTaAQQ7DFB6EsAL2Q62yUZACYy2u6gY395DObwzs492cJE8jSqyGsjLxQ
	 rk2/0iXzVcALpQaiDNZBfDfLCd8IO42dsHQO7CGpIxFaRIhQAfa70MCvefu24jZ2AhTFZ
	 /532prjo/iY81uwoCLoK1s6C66w28ClsPy7k2NdUY7ThsrTnEuKl2Uu6ptmK/1g1U4LWM
	 RHaZnIlNmfePmrrpaP1Jy20IycLnzQPK0s1R2St0z+NHTRcwfzoQyBjKOxKPcVhZg5ydM
	 u3Edn5JIiDdr8D2RsUf1l2K6rQ8A4IxU8Bs5DIA478VWDom8tARyDGl8hp+nJRw5AKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122341;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=CyQ1TfrEPi+FhTBp491LVK9S/7Sg9EJgDrYJ7czOPv4=;
	b=k1pfI2q+lmyNeLeUeaZHKIb7yVFLnwEg/xvuZfW0wjXBY+elooLhAli9H+cGB5a45oXt
	 qxnkbKSu1rh/II8sA+tvMZIpayJ4p6yWL0qHs4CxvvDCY+zfvfxhx08BF//EGpH5t0q/4
	 FtHY+9yHfh/Af0knBhobi5XxWLgalEYjvl3//kBFGJiJdg2sDYsBM5/XicN2xytejVQnh
	 cLlcUUlhpwpGGEuMfXJ/9pu5faQtWyBLZ581eP0wTvM8+e+phgySVm214YhHwL28n5V1N
	 JLeXXxYRSlW6VpXyhLU2XYOl4osh+SH7h57RFx8N7VxxN/WUWktmzAsPdFa6OMO4NXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A024C606A321
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 07:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A024C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jMkmY4p7Lz8Xrr9;
	Sun, 08 Nov 2026 15:18:53 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6A87IlOZ076261;
	Sun, 8 Nov 2026 15:18:48 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 8 Nov 2026 15:18:48 +0800 (CST)
X-Zmail-TransId: 2afa6af02258110-687dd
X-Mailer: Zmail v1.0
Message-ID: <20261108151848195Kkf_f5Vk8ogj7VbdDltdH@zte.com.cn>
In-Reply-To: <20261108151842879F_ON2AUBnuh5imOx8oZ1w@zte.com.cn>
References: 20261108151842879F_ON2AUBnuh5imOx8oZ1w@zte.com.cn
Date: Sun, 8 Nov 2026 15:18:48 +0800 (CST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tharvey@gateworks.com>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDEvMl0gbWZkOiBnYXRld29ya3MtZ3NjOiBQcm9wYWdhdGUgSTJDIHdyaXRlIGVycm9ycw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A87IlOZ076261
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 08 Nov 2026 15:18:53 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF0225D.000/4jMkmY4p7Lz8Xrr9

From: Shao Mingyin <shao.mingyin@zte.com.cn>

gsc_write() retries the I2C transfer but then returns 0 unconditionally,
so regmap_write() and regmap_bulk_write() never report an error even when
all attempts failed.  Callers such as gsc_powerdown() check the return
value, but those checks can never trigger.

Return the result of the last transfer.

Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index a3301502ce6a..aa2252402095 100644
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -44,7 +44,7 @@ int gsc_write(void *context, unsigned int reg, unsigned int val)
 			break;
 	}
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(gsc_write);
 
-- 
2.47.0
