Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695993;
	b=2lNDX1DjDXuHP89qajGCak6bro1CAUIVLP9/8RojyTPHTcczDkovKEdZPM4M1PGyEjwn
	 hcQsAGZIWPixV6hPeSl+V9C7ZH7cy69JoBg20FjcHlKg2F5JA4m2GCH0zW580zxpJTn6C
	 mqRLU5XByUHXS69lcIwxFlBedDSLEda2MrXmBrRAS+2IihFXtx+NVZYgPa+wAN5B1rTNW
	 /YXQ+0t8ZV1H+HP/NHKlROi0mkeksIXSS/oZlcN0+aP2G9UMeMPFS76LtvRynQ107Y78u
	 zFbTTyZzAc1uoyBUuKpS/ssVl5l8dYouUJtEE0WY4EhQX6I/L9g5EshZZyzJqCJ2d0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FDf27xnjIY0MGgU9QPmFgOgG3Aq3X7unXOSGnQEZ3Zw=;
	b=fl7x4M9A9DoXle+UoN9pyH/3HYi74wNBQN0mI8FYgpmzbawninYXhfWEXAHEj6Tv8Icv
	 iSpSMCBq2aWLax5x9S4ygn0CZFQSam3WxP8duyx6KXrndWTwB8NSPcFvGELU8iqnPui4Y
	 GQT4RCqHQvuPo0CFupBWVglzWixJ6CaSMMoaBIYfTKqbsa21TztXI3z+zIfsMLrKV3iCc
	 w6Dfs7AsW6uZGCUAmY4ogEZ7hbT3LFeVroKmEDDkxm0GJqkFHs/odYfypNckuuVrLyRee
	 I8KWttuoHFZb/CWd7s314WexizL8TAUT4sBU8oxtdgThvmOrjeLWcqm/MY39yP3wWaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V5kd7NJz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XA4dRLWV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C321606A323
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 12:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C321606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V5kd7NJz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XA4dRLWV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVMqH3177348
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 12:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDf27xnjIY0MGgU9QPmFgOgG3Aq3X7unXOSGnQEZ3Zw=; b=V5kd7NJzOdG1BKDx
	I5/IfSAIdzSsX2fnwQfRC8Ib6pN0PhViZABr3i8j+TcXy2/+4RuObh7mTfOUhyBG
	lpUcGwqLuHO6d1ShDhOgyP3m1JOqUkcsIyKwckbHs5JsWkzmwIaoAuS5fukPfORQ
	w1QHpcgzG2F9OJzhtLyY0Fo6IYUyGolDMPM9ratJxnB/4aiLTx+vieyBzrm+iZl+
	Um8lBMbrSAUrJcXlqBT8dFm7EvfP13qLnlz5lJsmEFHC5xK25A53GmprtuxoziDA
	Ayopt8q9+tqRTSMPhN08ghhqxJ4nbGuYPxHLR1WxPoIA+gzzdxAq4iBhkiTgGX9r
	qJ1DPQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sb3rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 12:26:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4162e1605so6465227a91.0
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 04:26:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695992; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7st1sIbjp7fXp+49b4SnP+k1ZW65nXD0Z9UoyFULBwGB3cMqFGNzGjjajHY9dS838
         gmXY1b4BlIUZi8YhZ4ShOiiQnC1OJtfmcwWg5QhY06BD8iWnq+OWfTwS4DUf3b1B7I1Y
         +rADaJ9VUVfLLicQQWxB+4mMjXJ8qHF6fQrqxXKGV9TQI72QU6OhNvpXEG41PX41kEi9
         /wRjkLruBou90v/1AAon2UWZtJSkdd5/qrI4L7lSTuAZZ3YlnaBo/VSL+bXj344MCrHh
         pPc7HSsvCQpv+/2AFyOFjLr/6Jwa6q3YG46w7hc/tSKLOoK8xBjpFlqUZwjeGZDsDqPx
         FWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FDf27xnjIY0MGgU9QPmFgOgG3Aq3X7unXOSGnQEZ3Zw=;
        fh=QvWEh/KBDe0JMtmx41m/QSUfTPve5DHaYzqakt9fp38=;
        b=Ba8TQibxjSXSIMWlwu0ahcXcYuycnZPxtdC1uT3NLGTyheYaMlzdQngHTWfPvx+7Vb
         pNrhpUfk2y6U91vcQfys6XK1ul6mJqiGYy5koIzvkQS4qj3r+ltaBdYXd4OAcA5t1pxN
         nKZvQktOd0eEBtZjElzkPwm7nTxESfHXXAwSFuk8+UxMFQhXrF3ks82207rE9buT2q4j
         FypGvKJ0DUyUqJhzrdoIg5oWsqMnfumxCxaRUqt0CxpJ1TmHI99uAvtUCNPwU1M58lV9
         RqUiXCluROLJbujdOVvV7ezsLXyhPOplUfkKnQB9OFM8EnCZjvwwVqL2GB7uDuZTGC1Y
         q8ZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695992; x=1796300792; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FDf27xnjIY0MGgU9QPmFgOgG3Aq3X7unXOSGnQEZ3Zw=;
        b=XA4dRLWVjdmGrqYE0ieaC5j3aDgB60ZyIwvdKczmlzLdE1Q6UWSnOw2hrKYJ+O8/Dl
         HnRARV/HcoodRatEiNb1f6/qy7ZUd06yWYcVFlBbJQfIUmubbrfeVhB7kfx43JS+mhOq
         hsC/thxvdZvAzgcVDLCkREcnqLwFQAmbb2ne1AN04qe8lkxj2kuH+En3mSD3D8+lp88n
         EOYGVPgGq0+3ksVT2H+oCzlnNFJKgwDQWNLIHkVJBSZY4DJW6yVqg4kRiEGEO0ybps8x
         WqQ5rpmiOCAEUokNx+S1knhOost73SefyOgctyf7lQdXD0TtQ+qnEyuWszJYEAlVgKGu
         E09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695992; x=1796300792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDf27xnjIY0MGgU9QPmFgOgG3Aq3X7unXOSGnQEZ3Zw=;
        b=Lt4NOZQ4/I8tBuk111KAALmxflj4Dx8LE3YIpINPwBzWEFzlm2SxiDLekhph9rzDSJ
         OqCYR/Ds006kwawQOY3RkfyKAcof114qLFREDpedtVsMM/3/qR5QT89wbuYDoVWMA9Is
         LYLCoviYnqfg/ifloyEVsXBxcbbpyp5AhKdcrNpxj0KBeJxFb6KIij44Z8yI9N6ix5um
         8TMPHCQhnsJF1ONeTfVryCbTxYU0uQrB+0nACxryGHjKpa79JozDaUXprXmSfjU70Dbu
         y43I512guW/9gMXxwIznx8jc1l3rW6euj5/cV7j4sYHJpPa8bGewhzKVC5SyjCCO50AQ
         i15g==
X-Forwarded-Encrypted: i=1; AL+hErGbWuTuT+AV/nMh+vaC3ZmaOWn5/pbWDXeE20aJbMcu41Dw214msEzC/Z6FyKzv8ZmDwW8=@lists.linux.dev
X-Gm-Message-State: APuU4Z87iOFZs8plo1F1mIsFngmF4lrY8q/8m7ZzZ5C2yW+9zYQ96Klv
	G54v5z2ZZVH4J/Cl43YaaU4eBsNePDb5H4w8DNpCinjm09pih/vnkApRDTS7fu5R3EIvUql/+lR
	F7ALkq53GiBUisXZHuxF9gAoX6Ltp79vuahj8eE66B+10WjoTMGA/tuShII/CVOsNHAyc0uMhYs
	tAPx8c4172jJWHlD/9t9FugNH5mdgpgw==
X-Gm-Gg: AZFdTZfJslkqvjx0iXvIPFfeCPam13kYeKH5XXYqjzk5a27HslBUkvPGPleXQvlZOW8
	4+OqViHHAF6BtkKh0YTG4e+Vw3bv99RVmqGkwsqIIbi+yfxL9p7AS5mlDaw7TeP2iXM3dTx1Nb0
	KU/+vGkMkdigaVMfnI8csUtazGujQNGdMyWZhaf+uvgdlUQZILrQhqsUr95g==
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b41c92ce58mr20258217a91.25.1795695991783;
        Thu, 26 Nov 2026 04:26:31 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id
 98e67ed59e1d1-3b41c92ce58mr20258182a91.25.1795695991298; Thu, 26 Nov 2026
 04:26:31 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com> <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:26:20 +0100
X-Gm-Features: Aa3M54oSOwHoQYSn0V3AtuTR48SOSoC8DE5fzBMGlfQpwJvg-qreLFgHRZWsWfc
Message-ID: <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>,
        Navid Ghahremani <ghahramani.navid@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b082578 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=kvRnqJp7QHj-O9gkUQ0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: em-gVXgFGLmbtZdfvXd3Tagw2sbHVd4F
X-Proofpoint-ORIG-GUID: em-gVXgFGLmbtZdfvXd3Tagw2sbHVd4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0OCBTYWx0ZWRfXwraFE6s+DxfG
 RFJSLk1Mdx6QGc+2ofawvnsEarkQ0RU7HaFC4ibeGE43FNn+PTYwlXJ+rojEGGYxwxijijvCfaf
 DWShuBEsdZdYow3nS/T4KbOrqA2pBJUslcvuzOJ3JrRTD7ZStjz4Qj2t7+dYd2Bgeo+/kpwWisn
 K2haR4eaQAR1W3wUlbg4WN8cNnslN7VAwrfyKQ7oAbwefTqfOEVrV+rrzGX8Daf70b5qvPzsgqf
 jcqPBxoUsT9ocApBftK5pc74uy8GlfBxhtXtgpHJAtE13saBzUXrVZHUDJ1NWDlLbEUDmqvqPqH
 QEPoyGYWhPly6Q18PFtRD3RaNwrWJCvhzZHUaXL52KvPwGOd3v8IhjRjA1GU7rLsQjEE91ngzeC
 5e1xXPMQ72YX3yNNX/fdySwEWaT318mMKpWMv/mxXMHGWCrCLslTtpBI8hPd64jPIB41qNBOvtJ
 n3Cw26YGUy/IijTyHCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0OCBTYWx0ZWRfX/Yuin6+JBTlS
 SXnGVk0s88FegyXH4h7z0oEM+CxxeOLEDN7YLaJ7QqgHfHdPXIUZGoAqmC7c3W+9F5CY2nsZAPy
 pq296obBuB/aeydUkQSqwReq0G23d7c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1011 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260048

On Fri, Nov 20, 2026 at 8:21=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:
>
> This controller has bits for USB, HSIC, EDCP (a cryptographic engine)
> and GSM. Not all of them work the way one might expect (see comments in
> the code), but they are there and can be set.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>
> ---
>
> For now this driver can only enable and disable the USB controller. I
> expect more LTE related power switches will be added later, but I don't
> want to commit to how I expose GSM and EDCP in the bindings just yet.
> ---
>  MAINTAINERS                                 |   1 +
>  drivers/pmdomain/Kconfig                    |   1 +
>  drivers/pmdomain/Makefile                   |   1 +
>  drivers/pmdomain/zte/Kconfig                |  15 ++
>  drivers/pmdomain/zte/Makefile               |   2 +
>  drivers/pmdomain/zte/zx297520v3-pm-domain.c | 286 ++++++++++++++++++++++=
++++++
>  6 files changed, 306 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ab8797b8d0a5..e394e0044f1f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4038,6 +4038,7 @@ F:        arch/arm/boot/dts/zte/
>  F:     arch/arm/mach-zte/
>  F:     drivers/clk/zte/
>  F:     drivers/mfd/zte-zx297520v3-crm.c
> +F:     drivers/pmdomain/zte/
>  F:     include/dt-bindings/clock/zte,zx297520v3-clk.h
>  F:     include/dt-bindings/phy/zte,zx297520v3-topcrm.h
>  F:     include/dt-bindings/reset/zte,zx297520v3-reset.h
> diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
> index 5341dff669be..d5050c22f064 100644
> --- a/drivers/pmdomain/Kconfig
> +++ b/drivers/pmdomain/Kconfig
> @@ -21,5 +21,6 @@ source "drivers/pmdomain/tegra/Kconfig"
>  source "drivers/pmdomain/thead/Kconfig"
>  source "drivers/pmdomain/ti/Kconfig"
>  source "drivers/pmdomain/xilinx/Kconfig"
> +source "drivers/pmdomain/zte/Kconfig"
>
>  endmenu
> diff --git a/drivers/pmdomain/Makefile b/drivers/pmdomain/Makefile
> index d7aee13ae571..cc3cc7b3d1c2 100644
> --- a/drivers/pmdomain/Makefile
> +++ b/drivers/pmdomain/Makefile
> @@ -19,4 +19,5 @@ obj-y                                 +=3D tegra/
>  obj-y                                  +=3D thead/
>  obj-y                                  +=3D ti/
>  obj-y                                  +=3D xilinx/
> +obj-y                                  +=3D zte/
>  obj-y                                  +=3D core.o governor.o
> diff --git a/drivers/pmdomain/zte/Kconfig b/drivers/pmdomain/zte/Kconfig
> new file mode 100644
> index 000000000000..cc329d085e5a
> --- /dev/null
> +++ b/drivers/pmdomain/zte/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config ZTE_ZX297520V3_PM_DOMAIN
> +       tristate "ZTE zx297520v3 pm domain"
> +       depends on HAS_IOMEM
> +       depends on PM
> +       depends on MFD_ZTE_ZX297520V3_CRM || COMPILE_TEST
> +       default SOC_ZX297520V3
> +       select PM_GENERIC_DOMAINS
> +       select MFD_SYSCON
> +       help
> +         Say y to enable the power domain driver for ZTE zx297520v3 boar=
ds.
> +         This driver is necessary to enable the USB hardware found on th=
is
> +         board. Say y or m if you are building a kernel for a zx297520v3=
 based
> +         device and plan to use its USB capabilities.
> diff --git a/drivers/pmdomain/zte/Makefile b/drivers/pmdomain/zte/Makefil=
e
> new file mode 100644
> index 000000000000..8a4185f48ff3
> --- /dev/null
> +++ b/drivers/pmdomain/zte/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_ZTE_ZX297520V3_PM_DOMAIN) +=3D zx297520v3-pm-domain.o
> diff --git a/drivers/pmdomain/zte/zx297520v3-pm-domain.c b/drivers/pmdoma=
in/zte/zx297520v3-pm-domain.c
> new file mode 100644
> index 000000000000..3df4cd5f1b22
> --- /dev/null
> +++ b/drivers/pmdomain/zte/zx297520v3-pm-domain.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan D=C3=B6singer
> + *
> + * This driver controls power domain registers found on the ZTE zx297520=
v3 board. The USB and GSM
> + * controllers are controlled from here.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/regmap.h>
> +

[...]

> +
> +static int zx29_pd_attach_dev(struct generic_pm_domain *domain, struct d=
evice *dev)
> +{
> +       /* The DT link to the consumer targets the (MFD) parent, which do=
esn't prevent unbinding the
> +        * this driver or removing the module. Either would leave the con=
sumer with a dangling
> +        * reference.
> +        */
> +       if (!device_link_add(dev, &domain->dev, DL_FLAG_AUTOREMOVE_CONSUM=
ER))
> +               return -ENOMEM;

This doesn't belong in this particular driver, but rather in the genpd
core. In fact, we have a proposed patch [1] that is being discussed;
but the bigger question is if we need genpd provider drivers to be
removable at all.

What is your use case for this?

[...]

Otherwise this looks good to me!

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20261112-01-pm-device-link-v1-1-8932e0862378@ke=
rnel.org/
