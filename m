Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F634D2ED9
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603871; cv=pass; b=Ej8rabfafD3K/cae9Sal9kWTOb1N8CW5jnjys+ssH8hMp1IIeDEjOOtwyc24LwugKnq44DpYnTXnDVkf/bcyasSHVAEE6nCkrVKVqs6TuhVdE261+qzDXiEL3f41BoCffsr3Mr72w+nqlPUBVQ0Lryh8TAzTbuWPpBmMT75badk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603871; c=relaxed/simple;
	bh=N0apPBi5a5rdeR6XkE9u3uUSLlm4uI9nB9Kynheh+l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LegwDX715uxy7kG3styXTssGHZpG2I/ezztr5G0bawYNmDt2WsKwH7RU/atwsugl7aDAfBij3K7scPyuukFHWsC4RKKmygMTkMi49PTPG2yOkv0H6CYdFPxNRZ9l7Fxv1oNFKlUMfY3m0MtBqV1UQ+hbGYfa8C2/2snEj1QMt4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4tRZgHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZthcBuwA; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4tRZgHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZthcBuwA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAQCZ782765
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 13:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=; b=Z4tRZgHZskb8ptT5
	TWLgXlXd5ZEfOMXoSIMOXv3xiSCfmZPrN/BXEN2Jx/EI7xgxsl/mhtg23qiOqhBr
	lotZeIr931hrlSEd5cQ/+wfndIUB7MMIEPhy0N4qQaoL3vx0QDP3gKzGCBMkjA4K
	qZEViEARpzKBw/bZJdJ6k6fM60UXmpX36/eFY3dIVjAN/AFSwPSLBAOzinZyFOZG
	8mAxM8Svcg16uWsn2JDQlVfu7pS1jD7EKG1O73xL6IcpK9DHPvN80Fj2n8ZkDcIH
	gzgCPX/52m/fh2UgSttxIDJ4qB8q8S1LQf9euuiVEAdLjZcrqYl5RVZOicTCxXKu
	X1l8WA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav4as4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 13:57:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-870ec29b035so921135b3a.2
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 06:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790603868; cv=none;
        d=google.com; s=arc-20260327;
        b=pyidSlSDHSFptO3C8g6UA4LM+uBhSvJlbEkiA8tPmwWL99wFHIEYQE/9FiTWV6qNZf
         KMp45A5dEBtgbRryEHruvweGYsyKpKaupFxRW8Sbjq4p8k6s1JZIqV15EaxoO7Pqpgh7
         ALgcl6L6wyyYwivvrU9b1DibIDBb0jPN90zzYCKODDMayeZDlMkdcdT5ETtJGg7Ju40y
         srLCYLxpNdFkEegpLppXxbmwIfjes5fGwIAPW0yGtIrOdb9qu5hMxpqBnY9HMXXhI7GA
         jtszRsIi9IXS95VoUj61mEUS6iW7y96WqeJhNQQjNXU38Iw2Qv5jc+dOPVtrYtzwWZa4
         fXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        fh=cSBbzN7edJNyUzL1Hl2MnczsGGGi525O9mgNdJG8fdg=;
        b=jRV3oncjNVPeXTH6Y7L/CN7csVcpTaCQ9rFiUiYzHHJj3ZPcYk+kW5JGgHaKqXljeO
         7++LfzcFI6GzEwdl8DzV/NaErFiH2zTWaa3p2mqHH/zYvRpfYivx+tzgJ3IW+/88GDwI
         mHBp/26NhaFvjcagIFNUqt0uELgvovyWJZdTRoxznOWoCtoZQXLhTIDh7QQaydAfO7rA
         rENCgbs96OpWvYXASNJbguPPGDOhHmOHp780kFZZUFq1kHQSQU7E0MLrTvOAxkj9ET+9
         HLZLN76HIUEaWkStTyYgC/0gYtkE5FJaqK7LqPovUvbQx5i7GBIvDfrbHFABI2QeeGTw
         RZvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790603868; x=1791208668; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        b=ZthcBuwAEWkQnp4MEOseHo6os6lXCibXt7ZPWNSjVOTUcBqH7ladx65m2GXsk5cvnW
         LtVGhIgPt6mmYNg4gHwDUpl/OMHKczLBG2Zl6bRR7R2hJO1NHGgA/twFC5cueTvu+rVW
         jnT+Q63cq1CrF/6HzuPXOQ4mFSEb7T8SixORrsXlMmsftKBasoJ29oCk3Lrorfjxm+3d
         u+FFapV3BDgKpQzzGSn9TbmxqGBH5tLmrGMH87UdvmPz0FLdkxnKRzoDuNanqRUMJYAi
         0WfHiqbXXSCUkwpEgaHG7E4O0p7JhUp/vR3Rj8lSQ/51zv8XixfsUQfnXvIrD0ru7LCS
         seXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603868; x=1791208668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        b=BeXc4Qgk6OUXvDvAFoP5jG7dw03PNg9k1KUu+5n4EKWnqZ0HHhBX6tiHEECwEgH6n8
         RqLitBO/rHnhH+jhNJSFvUZm6WlP1E+EXGojb7yIRb4qF3KmtH9CEwxY9HQpnXVgLEzz
         I+5Q+J0E7WmRUzsb+T1iP7592+FAqNOhXjVjgldhxR+XKo3yKSY6JG4O+YNNnK/yXXRu
         XH+K6Cz4UsK+/pBIgTicruxFwDzTzJ4y6KBDsa/yH/bAvXcZVv/XzoS8KIQZ+psw0iaK
         cqf9QuXZ8opXbDXgZ2/XRZGNcmfiHVgQg9qzd1ujQAs07NWXS1Irf6ilJo5DmJkTV8fE
         6HMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzGvWraLwzFnQgr87u60ImFFGZ/4i7iOoUVUXYy0CmX3e+M2Q5GLuroG78oISI5bTxu2o=@lists.linux.dev
X-Gm-Message-State: AFq9FYKmNXwhgs7hwDddoZsnV/sS+F67/bkVncdlSL8cYUngtoCwuS4V
	1k/hxN7RYlwGirrw+U/zgnmYBV3HzUp6S+SBmv0zkPZZMDf2W2V30q6qFVqythHKoYh+RHMYV5E
	R8nn0S202bdi5pxXND+Lwl7ff467jKIyFaN/+E5lNbTwZiyE7DCkavhbTPm5natHKUuK5QajgiX
	pkAqT80K1y9zAjI1xTqDd8h+j/rTKIKw==
X-Gm-Gg: AYBFou1v0HWEoLA9WvNs86iezvbL59tqLhHJEVJHUOg6phF2LM+xZyY5ji4fRi/xbwp
	M2ZwpN0qjRZFuRxwWyGrxfJJk6odTxEWy4t7XKeGfUZ1N+gxuk/PkTYeRwoPnV3vK7fdeCThT6n
	iiYUfB5oBuFw/mho4ooIeYZHahJbytqy2r51vzaIMpOaZl7Fa3kw6xcyDCTg==
X-Received: by 2002:a05:6a00:950f:b0:881:c881:96e8 with SMTP id d2e1a72fcca58-881c8819a45mr4006747b3a.23.1790603868156;
        Mon, 28 Sep 2026 06:57:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:950f:b0:881:c881:96e8 with SMTP id
 d2e1a72fcca58-881c8819a45mr4006707b3a.23.1790603867726; Mon, 28 Sep 2026
 06:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-4-b96fd3fe298b@mainlining.org>
In-Reply-To: <20260921-msm8952-initial-support-v3-4-b96fd3fe298b@mainlining.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:57:35 +0200
X-Gm-Features: AclHuK-nE9h16BssbY-0V-0Lcqrz78yNjoqqCVRnCD5BWpC1wzqbo2Hd-T05VXY
Message-ID: <CAPx+jO9Vj=42dHEwLzTHe1b+nrvip+ibVv4iPquxwJKbFAkm=A@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] dt-bindings: power: rpmpd: Add MSM8952 power domains
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 3Hu7t_GmQmsMwzUwDUaG82-rDm0z97Dr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfXwAbfHQ9/iwNJ
 J2CZ6LJLkS1nWxdyLGEq4Xc65Ws0JNpaJr/sZMhd/TGvUGSgA0CcQHQfyq3hhGsRhW+TNSFiL9j
 3MrupbOX9JMAj6alA0/pbPll2rQknGyD7ZteF0v5+upOQ9kFattFiji0AzF9maQE0ysGIBGwhjp
 r8iOlTRBt9PexXES1hmSwCesrQFiv8vraQi/wRtFD+F0OI52rGwry+TO1/MS6aFOTwbkbFBBXQ2
 whJaIpYnWTUNAC6WJdr3BXl5KrukW63wN2+DznqJRYTGAPN8KTr2p2YxSQdO6c/TtD/Vro00jKV
 C1vmq0ejlgbMHkPgSWRM3kPC/LEpHk/9RIXm/J8Jx96w3UY6EtAnfhotD3+liL1lP4FOYbO+569
 5GG8oP2nlF/YwpbM2oGfwtQNB4mgIQe8fLOb/S1gEs7M/mccrf59sGffEV6ZtMHYK1BURVd61zq
 zchwz2wduvKGG5T9pAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX0dzLZnR9R0fq
 J8RlevWJbZMuiR37OaGU3xNX9thhUAkVUg+L3MWhpU6pgPN9GV5JJ8/9MJZemd2gN/vxf7I4S/F
 lN18PgD1ux3z96z+lbXDPWviAiXeBS4=
X-Proofpoint-ORIG-GUID: 3Hu7t_GmQmsMwzUwDUaG82-rDm0z97Dr
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba725c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=xo1k5ONJVskqAlz3UKAA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280055

On Mon, Sep 21, 2026 at 8:19=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>
> Document the compatible for the rpmpd found on MSM8952.
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index a70bfacbc5d1..8ee1c25a7c9d 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -76,6 +76,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,msm8937-rpmpd
> +              - qcom,msm8952-rpmpd
>            - const: qcom,msm8917-rpmpd
>        - items:
>            - enum:
>
> --
> 2.55.0
>
>
