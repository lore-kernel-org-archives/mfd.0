Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F743793D2
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074823; cv=none; b=dCIjO2RRWQrbSw5fwXbImdKKsJe212iTQZenfQfscKPHLsVJPkAdXmq+l6eTX5winlKQqWistHpYgv3oASg75nzVcQiIC8Paykt1jFTmhlh9brcb1ViujS7BcNwvdZjqPhVzGvquMm0fWZs5B8XM+APZFvJGPG598KPT6Jh80gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074823; c=relaxed/simple;
	bh=/0OHB51Px1kwmAioyURonbOhXzHFSra/T+tZss6z+H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tcSYpGdZuEDolCksXDTrFzRFqGPqV6Vdzn73yx7xuIroHyRkFdQvSN7u/eKbBOlmuUPOF95aFdCPbRXS7UjyvOZxjY6Xhxpsce3ZLYgnENyndYJFDUoeH2Vwg1bXL4PW1rGQKQ8XEseoCHeAfJzSRzIH+heE3/cw9gz4s7WZdvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn31uHLo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn31uHLo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso56845355e9.2
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074816; x=1790679616; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7qcpIDKckcU+FwnXhQhXsF99jpMu30FwevkL1hVHm8=;
        b=dn31uHLoLNO7jHc0dnbekYwarjaO4YdLoUxRrV/gUFSp/C0q9dVFQdTyX9aKdBZFNf
         Uq8PIoYWI3K3ytW+SpQHQpe4N62/yVjTBhGSJhup3F6vBWta6ocyo1jn622ocBZVznBQ
         kfa1gX+cN9s/JqWYxANFUdqEcn5Qwdcw/V8KL3rGBmhuHlQHeiUBccuWNE4uChkt5mgW
         28TOQgA9G/fwDqg+fw3x7k1wAJR2a5DgeQduNrnkGTzN3uEohB2FBEsN/pcLr3+/WF4M
         IuL8iZif3hKCxO/fKbb3pI4nzWTFl6TkHQYcgmBXpEzgdmVx9sAuTXczgv6y3fENNNfb
         T2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074816; x=1790679616;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7qcpIDKckcU+FwnXhQhXsF99jpMu30FwevkL1hVHm8=;
        b=kg0f/Q9pBpsdgSdRfuhe4Trl6rR/v6uzAWPDliVx5I9hE9yZQiIBQ4fpZHmkyMOT+p
         yk6of00uWAT07nZZmqyBWYIM9X7JsJnbcfWvg7sXYIqU/He5C9YQxhnzNwbEb669Cok0
         NJRj6XbCrVdvdtg5bvsL1Q/FSHQgLJm7snmbFHmdf6/WxyO7kOh+mnDz9OtimG/68uNB
         MYwjKSt6rw6d1QzMZXe+KjJHF+BJqjze3sENZEjF3DDp+SXwTzQpj+SadhEvFuiqolos
         MHi2LZtdc4lhmwVyJdKS+e6Y5pK6Jpsz0wvceHsAL0nZ92JXIQDET5U9wmDTCDdqg1u0
         ic3w==
X-Forwarded-Encrypted: i=1; AKwUvBwrJkvb/5psM63J1GqQ0GwXF2QR86MGGONtlOUomx9DxaXiYJVEcoSrHPALDznx/NMWxKA=@lists.linux.dev
X-Gm-Message-State: AFuF++lPYMEKdWH5WHF/17EJc2hjQYHG1NYlVXHxDECNgy1pftqla8lR
	QRkXTl8V/nNO4JTeBJ4Xv9rrSwC2aDdjlLPetOdaGRHSsGGBgLWk1RVrXh3MQB+Z/jg=
X-Gm-Gg: AYBFou0MHcqXM5q/COq7jngZ0z6ifZML3RB7jk2YhPcSEN3aP1TsENdkea9jo+Nxo1d
	oEt/e2PeBUUNCJI8n2rb1KkslZUwoMXB3qLYbO79DvCgs7jTHQhEdy8jvF2/4hbARN0EPzouGEn
	aBNWeeUo8nqDf23RWDh6GshTNjlR5k6P8U8pjwqBHs0ghJ9gzU1C5NqceurwZneclveMUZ+JUcK
	8zhkR803MQO/W9Z2VSvhUsL5WVxXxj2E3MtbP5uWTA1mPl5AcYXXvW2H54ZkQMFoodapFJ/Ltg0
	z9+rnkF7YuIqQWLmX/knoeMaPSO2A14ztqZJg1jIO6JyrK4AaED8CEbavdbBJO4EV1ZPC0O5qQV
	sgc8bOaZPzwLbF5pz8yOH1KPsoXmN6+i09C/jetn709ZSEELlVqV0DKOjfmjnZr33L31jc/ZfmV
	xcE2XSJilBgANjrFQ2Y/gvnN+I+4FRlNvrW5mnaXiMA/GkcxGvYG+brRM2oYXRu6uLV0EjMlrnv
	ONrHb4=
X-Received: by 2002:a05:600c:4e4c:b0:49f:bd3c:bc28 with SMTP id 5b1f17b1804b1-49fc574f456mr195177935e9.35.1790074814606;
        Tue, 22 Sep 2026 04:00:14 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fdaa4e47csm85599365e9.1.2026.09.22.04.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:00:14 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Tue, 22 Sep 2026 13:00:06 +0200
Message-ID: <179007480602.173050.17097175603597060097@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922101459.GB2730113@google.com>
References: <20260922101459.GB2730113@google.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lee,

On Tue, Sep 22, 2026, Lee Jones wrote:
> What on earth is going on here:
>
> https://lore.kernel.org/r/20260907-glymur_camss-v2-5-75f7982dc983@oss.qualcomm.com

Three postings for the same PMIC, in order:

- Nihal's Glymur CAMSS v2 (7 Sep) carried PM8010 support for qcom-pm8008
  as patches 3-6, including the no-interrupt case.
- My series (8 Sep) was a strict subset of that, written without
  checking the list first. I withdrew it the same day on the cover
  letter [1]; please drop it.
- Nihal dropped the PMIC patches from his v3 (17 Sep), and Jishnu posted
  them as a dedicated series, "mfd: qcom-pm8008: Add support for PM8010
  over I2C" (18 Sep) [2]. That is the one to review. It runs on my
  board, PM8010 with no interrupt line, and I sent a Tested-by there.

[1] https://lore.kernel.org/all/178887481187.4612.2819576206036967152@gmail.com/
[2] https://lore.kernel.org/all/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com/

Sorry for the confusion,
Oleg
