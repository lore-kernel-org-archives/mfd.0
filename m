Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621445;
	b=zmsyHzD4rsA2rpjHBXTcm7vZBJx6xJ6zmHrgyQ773XgEx3BypAylIvloA6ulVHHwfMVN
	 MqofGnWTN8UXVOemTW38UkHgv+PeaERiqUBjH5VJQC9FJeOPHBiU4gxmmOxQri2B0qV/E
	 08CRlHFZsD8zfUo1nLlJDNUUvQU5VdmKTmUvLcB4irM/NgwHwga5TPbthZ3L0C9dw2Dyg
	 qoH9UnX5Q8jinBAByAfr4l85YLT9HKrCuuNccYQduB6F1BTGN44wOGeSYUL8faOQQExzK
	 /xAQBomV1aKfw23rGQpyCm4hL3676A1quJa3b5BtddJu7vbHa93RhoTY+im2TKzFgBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
	b=ZgBr4W/fr1BB3JKuIcX9bBBACLRED1J2tE6PmeRooj/kWHrrhf7gy4f568lb9HAweKhQ
	 R4E51kCe3efadVYpsqAAWu66G2lmZQNjMtkD3AD+eJ8q2xqfPYDRcMJZ1xtjUOpvAia5y
	 d1vqJz8ShTxhIjr9yZgxezrb9wrFmtBGzdh8PDBYQ9mGWH0MUmIkuXEBgQeqohIFvtduD
	 jmAWDBY416y6ZmAhowjw/n2wsJDVdnIZxaES8HgYZgkjNaxINaRZ4rveuasIyWZzWFkby
	 LPKI2KZosmLUHEEvpLQD0uU4Q8XOAWj6ZazyeU86saeUg4j+QlnvXJREk8coVgS0ejg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdUO5B8j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbUCwx65;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB64606A333
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 12:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB64606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdUO5B8j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbUCwx65
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AHpu2880728
	for <mfd@lists.linux.dev>; Mon, 2 Nov 2026 12:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=; b=JdUO5B8jkzGJ1ghc
	dW46UKYpW53M6pudO7cL/b9JbRwchvbki93C49mCB+f/o0rUg+RAO+wlDA/rLu/d
	POQXRPEsul4VGt6V1oSZkT/9UY/5UzYwWAgifz5ty2DPyj+2krgzx+mZ3UYag3Qr
	wns7LaRerRJ8zdqa1pqGdp+q0ZDhs7krdryL12+/XXmcYIv7jkWuIG9HYu4WkF47
	mH44wm7A3MK2Fr4CSZdprKt36lpBewR/TAleQZiZTnzoeRwv9jh2EKErFQp2X/hN
	+V8J8Mam54afXT361VTH4k6rnsjZeMwNyBBUgljk4mdEZOAEbXef9vSbXYlH0fSu
	mMel6w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgrf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 02 Nov 2026 12:10:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ec78f43e7fso51456e0c.0
        for <mfd@lists.linux.dev>; Mon, 02 Nov 2026 04:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621443; x=1794226243; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
        b=UbUCwx65Fle4ilOp8xE8mOj46/pLi5MalVHift1FxqZTHoJq4MMxJlTX3+egetZk36
         fIYsz4XIHh+UweJLxa9O1c3AtuzFEpHTOpzL/d7IqOr2nwWN/NrHznTQHskCIQIEXevo
         D9sVlio2WA+R8NS6mTHmBuBBM6jMTe0bfR8Fd+MwuQp6aFPxJ/4B82EwpyunTCJiHoXC
         6ODq9gftHS2Dxk/Pc3kXsDeIfnvM+7JawMSVm0OCNdDysExy2UK7bJA+Vm4Jejeph+Cc
         dIwAk9Dgsf6xT6nzUMyf5chtAyhIxDq2IuxGFsGSPlp1IoVRJdIlEGZ8x/Y9XAv9l96D
         yPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621443; x=1794226243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
        b=h9fUZfwFa5L5OwCnGqW6q/oZbbcEoeAwTf2s+5vCGGdxzTX3dMIwl87TT+eHHY3xZf
         s4fh7hanjwInlLqFSTKuWlBZ4FC032dtTrFW3qfhi0VnA8oaQVIgh+hcux6Noi+Widvz
         30Lsg7kFqlsVWkSUbsGk3QlD6PKJLtONodFcjgEifak/td1i79+xktRlR3vFXPEsNBYR
         G8VxF1Ni3aZ2jxe9z297IrXeoHgR99CAzcmG7+LBheV2yR6+iDcQJskGEJ6KWd+3T4Wn
         fH2/XT5fRHCq1XAn2qaHnJ1vaNVIywyf+vBvf6ZaZtGj2cGhlui8skPwbTLN4JEbUzmO
         uXsg==
X-Forwarded-Encrypted: i=1; AKwUvBzxHMpUvrcW9XsP9bg9tgjV4pClSKXkqelPL+nSKOTnE1o04A2KhiWwk/gIIWISA6Wx+h4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/q4XgXSjZ+zotsMU7rUtI3Xfj50YQlQ0sOaceBwcnZ0VpY+aKw
	XLTjWY0o/isLlXXZ76nctaR8hXCdCoZy5s/fcG46VQGv2EIXJ0zWQOhQN4qPjidWJLr2gAdJmH8
	IXXUw8TaWTYtpSow+26SwbRuFKb/5s7iKAq/DAI9C2zrfXhe3bBV9rHA=
X-Gm-Gg: AYBFou0inZfvGXX1/Cto7TQRKuwO0+d2TvYlujlMYUsf5xQQ1YPSOxIdvf4PfchLeSP
	A11vunRhLnckEUfprRO5sF7hXSXpkSnw+5kEwzL60+Y9DZO4mghSPxldtJaLCm8O6RrrG/FdChu
	rcv1vPmmHsVV5v06xpDDPH2Cb9GiJZHzKznOD1jd5u/KAJCi/9I4H/qWzK2NsJsGyHUjAOYduOt
	qN7GySoU+jpSUWI52b6T/1LPCVPfq4FCJMjJUY6CBQr8Ax9xp4Q0cAIw6k73GmTt7ZJIihEE+XQ
	m0YhkGNfB3CJDmorhxwEEJGq1D8L/Ji1FF5OOjDO6k77aOqehgjyIZsDhNeLmwmz0fJE+xELJnT
	2b+RE4bDYpZaImFVE/wKxXdCXSJJUjbLrY22kgnNobriiZn/9F1iBYzlhTT/WFVutSevan5s=
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr3466815137.1.1793621443192;
        Mon, 02 Nov 2026 04:10:43 -0800 (PST)
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr3466797137.1.1793621442660;
        Mon, 02 Nov 2026 04:10:42 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b51adb58e0sm1042549a12.12.2026.11.02.04.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:10:41 -0800 (PST)
Message-ID: <216ffb94-864e-406b-a844-4435b8ca47a1@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:10:38 +0100
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae87dc4 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=z6bgTffeZ3ablUicY0EA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: U4V4BXURFGBCI23-doiLZJ1ALg_uFeOv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX+K+zPwZNS/p4
 MRSjjITFMRFV9ki+s6DxEOIryuL2C3Lu94DVjOMg2HoeDYp7tee4577IHmrctE6lFzmx6zjGuT2
 6VOjZmPljISkPjYWSH42CqzeYPgP5lc=
X-Proofpoint-ORIG-GUID: U4V4BXURFGBCI23-doiLZJ1ALg_uFeOv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX+6nqSd7awjXY
 Etdfc+zS43LwZSa8Uz71lfUWuZhbouNC9e+V77B763zKnlEitzV6LjKqeB2JzhfIAp7BChvsWHl
 bZMGmvY0Ohl0BN0iwvpxr/mqsZwXiq3EKWBwGT7OBk7oZu3Sp7rSQdjWv1HJmO9lI/1NdSIT/XI
 8SndQ7BZPtdsUVx24ZlxhtVSSoGAT11ceGPzyyCsGT+rx685rFE4wcQC7ACPmZ3D5+9bd32Oq0G
 bffmwNUvyok10mG8619Y15foF3QHRjxCxpXPSni+oDKdEUMGBgdGkUcGwqupnZrwCPw8L+z83gf
 OVExl/2QH4wAjbqdPJw2bJoTrXxYpwOjWEBfJwePsIzQEBp9dAiYxzP6Bcj+MM7WGNHsR6+xxel
 2O88y47h9fQGKvTAByxX3NIU7XkQ5f6LEdYiayzwdYB818jzCVdMQDbnEzEH7VmBWk8Tc6rjy7D
 /biIFfLuz0j/Ao5+7dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020048

On 10/30/26 7:20 AM, Jishnu Prakash wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Implement set_mode/get_mode support for PM8010 LDOs using the mode
> control and status registers to allow clients to vote for LDO modes.
> Mode voting is not supported in the PM8008 LDOs.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

This defers the modesetting to the consumer. Please take a look at
the qcom-rpmh-regulator driver and implement something like this:

static unsigned int rpmh_regulator_vrm_get_optimum_mode(
        struct regulator_dev *rdev, int input_uV, int output_uV, int load_uA)
{
        struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);

        if (load_uA >= vreg->hw_data->hpm_min_load_uA)
                return REGULATOR_MODE_NORMAL;
        else
                return REGULATOR_MODE_IDLE;
}

and fill out the max current allowed for LPM for each regulator

Konrad
