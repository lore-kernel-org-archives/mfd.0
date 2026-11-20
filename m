Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202483;
	b=oJgCcZDG//EppRGjMxe6VvZ3sFhEeoxWT83iUZ1A4v3TkpP01qPbC0d8VCx4lNHKyRUC
	 6x/DZtFfzHm6whXnq9RcR/WyU2ys0+NycjUa6KI8sSEZ3JsHtSSbJFh8TZILL+046AGAQ
	 T8EKUuiAjmrvfUO88aC/lhdpfn2wR09EoPt2UlvMXJ1r1VQjd7uRHU3H8nA8fiMAV3OaT
	 ixZe0yN5As155LGEJdV5RinZqEg6bRTIB6RCItIHgc6E9b+7rykpEOWn1oe7mM8okoiU4
	 RQfTDadmnhNTVyZBfGjmqj7Bonw5y9NdYeVkQbX1o196fvmzNSowtN7PKEHCLaaIlZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=M1PD8j6SB5PHO7xYIjTJBlDsua4DeMv0pZZa5raCSBY=;
	b=xd7qn94egfDzBbRzbK4nLo/hQuATC3zMJ1Bg3e76TZYHeY/tiOM5kGWwXf6CBdd/2sme
	 LdFW7zFtuIJ8Wm+zi9M69fW2ue5sW2zw+gRgIGrY9I0aYubPnaghPOrtHSS53zXCich2O
	 Fw77FHY0TuGfsWZwOV205tMtMt5xqaoTc5Id2nt8Gz/zl8wS6wQqQnqZ23y9LSz+E6gHR
	 cEohArn9l1j9iu9uQQLp1c23Fv2fMVvKebYXMKecXJQeaBOeuiI6Sz0sZcS1G9NIymBUE
	 PPkvpiOBetFqzROWZ5yrcb1NNV9TdhjpD5Wd+MbUCS38kPyAqMHpWLv5OkQtC2eAygw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0IVxI4v;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4BC606A6E8
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 19:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C4BC606A6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0IVxI4v
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso625581f8f.1
        for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 11:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202478; x=1795807278; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1PD8j6SB5PHO7xYIjTJBlDsua4DeMv0pZZa5raCSBY=;
        b=W0IVxI4vIDw4uXgfgik3rs+dYqv6g1pJ+K4dG3jJakix8tWb/SC+u0GD6OwN22zTwH
         TXHmJch7jblMHGSygfT1jcjaHlqtM4DC1VhRSoJD8JyjMrn+ljF8Sli34cog3TSe/OKL
         gl633/DvnQLLv92NGRRA/Mxp7cCZB1fAXDeNLkxX3XyD7damGhaqSQL415BTuydOM1qS
         Q5NtztIeSrxY+HjOBofM+YMnGyDGTawIHfkOL+cUnuKmDPoCQ6ECFNAcCdZGDaSAnOck
         89pEXrgNjTdnvvLtvNqhUAnBKLPAIJ2rGWwPW8iag+Bj8uejD8FbvoMXG5TydrOQm/fL
         6MUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202478; x=1795807278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1PD8j6SB5PHO7xYIjTJBlDsua4DeMv0pZZa5raCSBY=;
        b=ERmtbQTn8qUGHgtd8PUsUQ5DmkqUzTjtl6EYUtEK2xk0sKzYx1N1St2KpibV0bJhQs
         mluzwljrBwdwZOQpCpVU3F1/b0d7L7BQawZCMSWHAdKPcyhwUITY7wMxDhIXUEuVNKD4
         WeptIgvtF9zkdK5L+6TlZlIcdxH7NjwJ3rmf0PrWRneOB/nssOgnvle8yFkPYrwOlZgF
         AGV0UbI38VyDi/LmXqfHCiWPFHYMN7NAB5qeS4me2Bejj4G4+YsCo8xxypnsk0IQINWI
         bg3wioSZY6nKnbGvl8F8bn6wPxpmVjmsKY9pZnq/EBI6Dr3QrYdW6WWxEadBvp/3jLCK
         VfVg==
X-Forwarded-Encrypted: i=1; AL+hErGGoZRTNCc3JieGMhDbDXFtVoj5ASp3ZBBBPnTQrnfm8yOXmqQnightWDDbkQcfkG3LMnc=@lists.linux.dev
X-Gm-Message-State: APuU4Z9VjTcPAiAPJc5aGNd3XpQnP/rBg88uSYeOBMDVeAfaFD94o1Ql
	HcDdpcy2dmcbq5GLXYZ9DPdJtGeaa44ESHYlYrStT1R6jSUMF+lXPYr6
X-Gm-Gg: AZFdTZdnB75u+lgqVe/GAF3Dn7t6PnFjObWLyuvS1x8Ix9pf/gpkJPCV88RG63Lu4dk
	2mSFx0PF60v+xthJ4aSwjVXSlZzxZXoFe9GCwmomuTd+Siem94+amnJnIbMF5FMM6CPyRTEyf7I
	nURlReWjskDRpMRu1zzc4qpqrPyaYQ+1ZaO1Dwp634iaVy9qD9ScjyHvHeIf0PITsHi1Aq8tvyE
	sHUSBnBnmC+tZY+Y7JkXlpXQ78ad84CpwQnJXoPgyVAZ0d2M/NakIlNOpBjDNgy1hSgWkd55nvY
	+VGGYuNREY8lkNhuGMYNiFVl0omujjwg2dplUlTCX/RLGY38TCMFOfKcGoUQkHahOHAu9DJzTLH
	V4alP5Y2TGAmrUfzzz9rrDBF0FrOS17V1nYwppxoks9dPwjQH6p5l6weUOxfNUaFBhN9qcoggrP
	zavP+Hc2Q8B0+f/X81Mms/JBTIjycAoY0HVpaHQjlo2LViENl7S6O7BjGOWlMb8S3bFDCguzTCq
	s4IjVfCPGKRMWbT6sXqTPUMVG8oAeP4fiIN9kGi2rl5IbRPgEZFmeaX/Kq8q5a/Qz1hLFeQarG1
	jCjE0hkctLiDdkeTN4S2bEryK+0JP/eVbR04AxShkq4dsmU7BbdPQ+Brm2Y9Qg==
X-Received: by 2002:adf:e014:0:20b0:4a4:ee9f:a3d9 with SMTP id ffacd0b85a97d-4abb3d2c028mr6479804f8f.16.1795202477805;
        Fri, 20 Nov 2026 11:21:17 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:16 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:51 +0300
Subject: [PATCH 2/6] mfd: zx297520v3: Add socsys to the mfd host driver
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-2-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=haBO5T9O8DxAeLkHhQl6vHvSOM2ApNjiaO+2we2t8aM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2WR3OKSSthkwM8w2YGowPMIiV8WT0ADPYEg
 gyX3RTbznaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJkcA/8CdzFthVu8Y5p4obuulOSnPPIeLQWVnC
 UpCUT/7T/s39YYU9rQ4pkMeAqBP7ctNWI21AIp9weT6VcqwQYN5x4QtRqXyFUSYTWQh1UnuZzO/
 uGObg2YzD/iK1GSAHk+30Ia3CYmsHJ7m9KuqJ9V6Mt7NNwSiaUTUKbFnk3FVauzrAYWxtpPnzyD
 d1zZ6BANKQVtMIQZQitU5JruOEKaTAqI1iKobUI8TnrqBXgFVzPxvF1Ik5skRlkWGkcYmxp7lhT
 U4nsJy9P/R0FT1hkJdo4AGdrDTkMjHKOh28vHZTGjwwlAePl7Zbt5PzvmiVIIrsBKDAVvbtx9+x
 veAk1nCXL8il4O1ssjB8MBk3Y47cNzVLeV/eZAYSHXacsk2RGACAL4QciW9wPRMS2g9KPy7p/gR
 83CGrOjaPU2i1O+GQq7VhXn9WXWTreWgQGYpPus75EeoBmZJfbtkQw46XMHxMB/0tpuAp3Gwujh
 5d+56Qd4I6w+xqBvuQAJHBCOlGbKKilro5h9H+P+lcy/DvSCQBcqpsm+V+c249lxUykPTWYbMRc
 SGVEQv0O/w42BhSCtahVA2SwKuD7dzvxDl8DL2+OeVCJt8sRgY2To86kbvtoabvrprLodxo8L+0
 ZLJqtiSbQRMUSLLn3do8j1mpqqou+WNLFwjlh/1DQcrHo23Mh454=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This patch adds the parts of the zx297520v3 socsys controller, that can
be exposed via established driver APIs to the MFD host driver, so that
drivers in the respective subsystems can consume them. For now these are
a reset controller for Ethernet and maybe more, and a power domain
controller for USB, GSM and possibly a cryptographic engine.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

This series does not contain a driver for the reset child, as
implementing Ethernet is beyond the scope of the series and needs other
prerequisites (namely pincontrol).
---
 drivers/mfd/zte-zx297520v3-crm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
index 7c29a860be3f..3d542e3dd7b8 100644
--- a/drivers/mfd/zte-zx297520v3-crm.c
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -23,6 +23,7 @@ enum zx_device_type {
 	TYPE_TOPCRM,
 	TYPE_MATRIXCRM,
 	TYPE_LSPCRM,
+	TYPE_SOCSYS,
 };
 
 static const struct mfd_cell zx297520v3_topcrm_cells[] = {
@@ -42,6 +43,11 @@ static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
 	MFD_CELL_NAME("zx297520v3-lspreset"),
 };
 
+static const struct mfd_cell zx297520v3_socsys_cells[] = {
+	MFD_CELL_NAME("zx297520v3-socsys-reset"),
+	MFD_CELL_NAME("zx297520v3-socsys-power"),
+};
+
 static int zx297520v3_crm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -77,6 +83,11 @@ static int zx297520v3_crm_probe(struct platform_device *pdev)
 					     "Failed to deassert reset control\n");
 		break;
 
+	case TYPE_SOCSYS:
+		cells = zx297520v3_socsys_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_socsys_cells);
+		break;
+
 	default:
 		return -ENODEV;
 	}
@@ -88,6 +99,7 @@ static const struct of_device_id of_match_zx297520v3_crm[] = {
 	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)TYPE_TOPCRM },
 	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)TYPE_MATRIXCRM },
 	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)TYPE_LSPCRM },
+	{ .compatible = "zte,zx297520v3-socsys", .data = (void *)TYPE_SOCSYS },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_match_zx297520v3_crm);

-- 
2.56.1

