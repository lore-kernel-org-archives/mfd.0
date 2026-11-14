Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794655525;
	b=hPvvdIbtKlSvDVOg2O6eiUrYroJFkuR7ZVPIoUs64curSqc8cMWkcg/3rzdxRSBDLxzU
	 huMWbjs9Sv0nIIonJM5PZujT444PhUWZ5vZo4VT/nMAK2DnWYY3yXgjWhk3j+dq8HaNSV
	 qOhpsczOErN4r5hLXMs4S3NPhAEr2jq418QthY2HKnyhJ5gJpgLzneHzHBIe1/9Ec1qHP
	 c7OlMI8jWUznT7qCLOiSeD8ZHcYa5d6OhRRPzflUjvnyyMJ2eevCM4GfBPiLQj2p1Z4pK
	 ar4RMiW1dTHtJRz5g93I0yoA4mmZUIj8X0qMTHQ8e9cUiahte6E0QqptcTB9C5cu89Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
	b=UvUdVDBW1106HmSGyWFSdl5D3CXh2Z6GKf1cnPyr/HnjkEex73P/kbHL78O7MUT1cuHT
	 +q0i5aczHtlayIcOzSkLwKDw0D7+c1ygZ5wgl4e2pWXJcPCOiMNVaQ+u72bwkwL136z//
	 Nm+7wahOJnY0PoKCkHv58PkHcz3tjga04c7F+/9bFNfSeBjnrZUHyJxp0ZfcXQBnNKtNX
	 VHp3nEZ6om1wSAZkWQahqtDaaIbm4TRxa1uKRy+9JfoBSdjfvpa6Kk3d5t4D0qcHAk/+2
	 j1LBvjOYu86RPX4vtEXHyrtUfCKmPVADJn3s9YozFNSA4miApMBcCPQolwItsvPvevQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXgSS9Rd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aX4tovZP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D086606A331
	for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 11:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D086606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXgSS9Rd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aX4tovZP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wHSe2710256
	for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 11:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=; b=QXgSS9Rda3Kv+k9P
	gzqe3kFPN/uWfUmI7OADtIldqWZDD+slzWtMPC/6dTDxMoFuvQd0N7gxLeJPQzVL
	Gx34zKckA+LaBZxTE6Es8GYa5XxLVKKy317T8OsxSwsgfLMrwNDpbiV3RWna2uNQ
	Q633p0yhEKggDTX7xY11chbADeulqMByJf3qChWKnbWHcJGNHise6+F6CcEqaBXO
	v7Rji8HvkddJBsZBOsexcXlNKMu6jOxc8MdeQ2/nDx6+sCsRyufemJ7r0Jkq9hAj
	v0Ns66yN3GBHSutZp6sEOu6Enxd5pUElkn+mYUsqEfaGQv8mIwxQ2sA9HyaUMbFB
	AVbl5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhgkwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 11:25:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so2971862a91.1
        for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 03:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794655524; cv=none;
        d=google.com; s=arc-20260327;
        b=UdcR6SrbBRPQxbMidnJTIiyD8opfdgT8cEwC1EWTms5zLMzaNtsqelvyzsOKwJ0J2R
         +9dqshfBKDIHcGfmyyPdat6tXvwi4YA8p2HPyCr15Jz70/sTBa5kssipuesAHKmckj/e
         9jiDBk6Scaz36rQG51JpNJrmSzFt/pS9iPk99ne29KCipt3fMHULE0SK/M3gzA9HpPNb
         mcINNGbUhffx+Hq4JRHHl3Ix+BO6R4VA8RwogD72PMWa3PNyHp7yzTbSGV+v5SUHFv17
         ZoGljsB0sprYyt4hedfkmbdvVvWfuQ2ctCu38F1kNynBEyFLuWqTqbNx+NSS02lyOuSI
         U8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        fh=DfOGVIfhTF6UHunYIKKdyEIblPRzUfhxNGitzRv43/o=;
        b=ZDRu7gOKlxtMIRWOV1Tc+tejD2WmxjDK1To1+no6cEmo900d6sNWrTRKgkKJdeCziM
         V3hcJXNWzModkDJMH1JeMDjSfIKoFSagFw2oaU6KGrn+qjSOhuzXVjz0Ht7xFVcHiksu
         T/udgKYQJWWTzyQq2ZXrf7JBUusVni2EQFjRBNmFlz0Bv28U62XnA7P3fvguuYt6wJhH
         5/1NnJVxpEydXm63aY4o87kzxcsHz3DoTgI93JXTtlIpkjjiLGaTZy3YnJk9vJZbnpO/
         WmiqIZtV0yKKT+t5hu/8NxhPZHEpQM+0l+sWcOKJW3JP0QiRb4Efy4LvzhNEg8igX2+Z
         EnJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655524; x=1795260324; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        b=aX4tovZPH03iPWGOolTo5PpRR9m2Zsw8OE7IG2aqrRvCmv8rgGO+GJzEVp9bxTqVG9
         +jrT3FoY0Pn36ggfY9hsoido+3F3k3LqUKkqdZeJb/cWEQGbsAQGZnlIqZExhJYwFC9D
         G+I8g7gPmbIZuWuqhsk5PYEFhm3eaCWBPf0tMC+L7EQzekYuKw8QX+Jx6gd97zKPqrAJ
         zjOqIKjHzC/QtnzF7MFdQH1lx/5nsmlRG1ym81Jd2EvRVAB4zEIyFwdmdIN2LaxIzRYq
         mrYsdwsuxRgJW28HQ8vQ3akb9/AsixT7yn+lDGjzBc9J+DtUIEAtUK7xmeRLeCG4WLA1
         WmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655524; x=1795260324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        b=lUSNwrgOJJWzdKeMLbSTcy4lTmCZYUxnFped43R5vONfp5NaHe3KI8X9fOvG+VP7+W
         Ee1tBIROFB+muJuJtH7rNWJT58GJ14poWMuc89U3VViGjaEN/xYL9+WYb618x55Pu/1+
         CRwEUr0SBEkO+QniszDevZ9VJ0Qv8iKTbG2CfKAoRw1fUHMgbq3RBwA6J0p0s4vyKA2r
         u4tuP4YMuvqCYafbWvbvZUKYo1x+0Q/uYO3d+LHNRNg7tP7brIe8BXo5moYF/NBGJk1q
         HBSHaNsNjFynNsIfaxKFV1Am0R+z5slii9L1iL0ToDp5Vt0FQ2mP8EnqWL0KPTDTNuC5
         l60Q==
X-Forwarded-Encrypted: i=1; AL+hErF1EgNjlzwBxVDbqXQ68HwifQ1zkyzWySYApRUsEHmKU9wGxhB4H43VWkGkttA2mu1JfN4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/TYhSg0wDG1Q4LXzHPGd28/ZWSp1qHzzBLUFahLiUlwZU0M4Vk
	r1rgD/CTEPFq7lhYwyVx7QFIDIPZjqFlDbhr5vKpCGZyXBeE2DtZu0t7NU5HdxG3PN5eK6USauO
	ZNJF+BCsveQf7zkOXGRWgJeQrhghURDpYDdChofPvpTR29MDz3q1bG9cTSIALSwixQ3kdnqEf2a
	9DsaXhTB8yk5AiChbXKORJk6QAEl7a+g==
X-Gm-Gg: AYBFou3os0UFjDmxO1PZm3SXNDHyDPoJGpk+kW4tbSkb5jhKMI+/MmisFq5YcDckCFV
	Ftbt/fPYOie/YTu40kXp8NqVQ+t5SW5JwZVKKK/VLcxzn7ECKdrtLTuT3SQ3oXiFqyA53qHBkST
	Ggk0Ygh7+K65aWC09w2iUZ/4vHuud+136URAiEuiqlibs8pF+Tq74E+lHNHA==
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3b1b0ba53d2mr5901010a91.31.1794655523648;
        Sat, 14 Nov 2026 03:25:23 -0800 (PST)
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id
 98e67ed59e1d1-3b1b0ba53d2mr5900978a91.31.1794655523156; Sat, 14 Nov 2026
 03:25:23 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:25:11 +0100
X-Gm-Features: AclHuK8s11-7hbgMIVd4tuDyslF9iqGa3b4ELmL8p_Ex5PIsvw1_iyvVguSEqG4
Message-ID: <CAPx+jO9GW7e0ai2o4Ycc4BKBywTaP=7NiWk68=c2kqcD_VrgRQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] BCMBCA PMB power, clock, reset and hardware
 monitoring support
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
        Ulf Hansson <ulfh@kernel.org>,
        Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: X0GCe7kWKgf8S38FsedKFDPS8O_oO0BO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXwkUXBWJBnjku
 +bLb7VJM8axBV1BBc0wW7zsVgovdRv18hKqAMLrBh2VWCl1Pu1eSIXORiU4p3SnrCVTn5+uGYmI
 SxGZ5AMd7ccyoHMzInMPNCyhUYtQzTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX39g7gEcjgLWG
 n5DOU3BwRfVdSi4UV4MCmXwofVNk3ma/mw/1fTJG83WMSD8R+Apuk5MaxqeKoua+TPvzpDkCjLy
 JxbOc4qd44FEYGe9qOlfrDOKKzX8SOkmMPe7zdaWC9SdoLvmKAPIVQYSohsYukrmdWm870Tt77k
 2vzlJ6doYqpMjZ9Y5hk4f5FoyA25HmJmWBdK7uXTM/teoCGHkZxHSZ2kBTO9LFiOAEkG/EzdVMs
 ohnWZgqRyy7RWt4vPFhkpHMmF3o1r1WkwHs8IA0T4MnwQnaKMui/iEx+F/+FZHHNEpCHFpzGdaH
 ZuILKYvOiWLkJkMwYP4ql0q0sQKXfv9jVKby+m+Q0I4Dndu7VDY1qPO1KtNiuJf/aXR1DQYEqpD
 P/9ZrgKy0W+7KukC7lmV6tDLWHb3UIj5p5IOu8Cp12KnNZsNc13/vSDPIsWS8Lc6QxDL8agqaJe
 uOwFzIcnY0kFdgJdwkQ==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af84524 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=vyQqneORv_wdx-tV-QAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: X0GCe7kWKgf8S38FsedKFDPS8O_oO0BO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

On Wed, Nov 11, 2026 at 12:00=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> This is another of these big upfront design binding and driver hoards
> that is the consequence of adding new SoC support.
>
> My stake is to be able to boot and test a full featured Cortex-A7
> system and the BCM6846 XG6846B is one such system on my desk.
>
> It's been cooking for a while in various prototype forms.
>
> IMPLEMENTATION:
>
> The PMC contains various stuff so this needs to be a simple MFD node
> so more things can be added into it later.
>
> Inside the PMC is the PMB, the power management bus. This bridges
> to several individual peripherals which are very clearly distinct
> devices on that bus.
>
> Handle the PMB with an MFD driver with power domain, clock, reset and hwm=
on
> providers.
>
> Expose the standard BPCM peripheral, memory, USB and PCIe domains and
> a combined XRDP domain covering XRDP, the three Runners and WAN. Keep
> the peripheral and memory domains always on. The power domain provider
> now owns zone transitions, leaving the reset provider to pulse resets.
> The CPU and PLL blocks use different register layouts and are excluded.
> This new power domain integration has not been tested on hardware.
>
> The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
> ports and copper WAN and has been tested on that series. The zone
> power-up sequence also passed direct CFE flash boot in the Linux 6.18
> OpenWrt port; this folded v7.3-rc1 revision still needs hardware testing.
>
> MERGE STRATEGY:
>
> Through an MFD immutable branch once everyone ACKs the subdrivers,
> it will take time I guess. Queue the bindings and drivers in MFD.

 I assume you are referring to patch1, 2 and 3?

In regards to the power domain driver (patch4) at quick review it
looks good to me.

If Lee decides to host an immutable branch, just let me know so I call
pull it in to apply patch4.

[...]

Kind regards
Uffe
