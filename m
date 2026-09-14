Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0291442390
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385006; cv=none; b=XRw9Xt1xBDec1riV2ie5hXBbmWGGdAilEm8IUqd4AVRFQiDhcquKvv7wUoYV0/g6UyUlSospqfuEtXt74Fif2WQ+8YrS9FuUwv0UjZJ1r3mPWNUlpu9sQiY7CVclwfziBwzzZdJ3sGKK5aw6K0nG/FULWKWj9ShVbLe1eqyqpQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385006; c=relaxed/simple;
	bh=9NTdtJ/TSp6i9fELQDWEuFYvwbqy3ev3R+H2YTC2xv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E19aYPJkRpjOoCazxiTomAnk6KQrv79NK6l24KF2+Dpy33CoGlIt2ZMGNKkB7WIQDI0xLki/9LSbiWqgvoR/ppZNHka6iZdbsjc+Rs5CLsvn2nNYYLGSf9hLwF2PKi7Q+/rnI0hs9EeIN1HRnzbBdytYReemfUX9c/8nC9ACaAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/WVOCmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBANMgqk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/WVOCmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBANMgqk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmBnc377916
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 11:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=; b=E/WVOCmY/+5Enkgw
	YEeOQ9dPHJUB8CWxTR20yFYOlY8UkoMJaYfEbZw5mtWvnO47B9tf1wMQPeafNwuh
	wcPa+7jFxuwllxPm+71b/159YFvZtg/2RACZvfhGXsdX3lRflqfucbjNfAT60rpW
	nT2W6tgRlLZN6L+MSJ/TNerjJkANtic5DzviOrYF00TQxSgNoyEqEGVr9kcRPO/3
	gIuOu7yV0ud+xAE5Z0o7WnQCbf35GMdm9FpQLiSsBTvoxEBODy0Mr28DtrxMTC/P
	1BajQAshRn13edHqPJho+jbGH0cD+CYPJc+8jjhbFR5E60BgJZv+Py3P6XJNpBgD
	ZRcYpg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8e86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 11:23:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d0caso39838685a.0
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 04:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385003; x=1789989803; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=;
        b=UBANMgqkRFiewqfYVK7iLce4yO10mBa6PCV2j0I0H/cTYrFgblyWQ65qOUmSO9TKEk
         n0LxBlNadhqQKZtRGGRX4xyzenkOVqfFwVFyffPYQlUYoPFKbtuPcs9E0euMzu+ZQAwr
         KLPWMgcMVFET7vWJSe7mIG4IaueVDuig9xDhpsx0crZj1q/7vEYngMOSHu8Vr0yNd6LK
         qd7ndU/ItW+LtGpHo15sW3zvCdfiZiJpaQLdYnhSzdazPR7Daus0Jeg4LhRcNmqHT8ws
         /1u6ual2EPt2Sb1Nm40r8PuQbzoF3chjYvH/DHoKhE/di3qjEmWoaiHQp+k9leTlfj7q
         A3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385003; x=1789989803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=;
        b=YZS6ukqSCvbIkVNmK9YPDbriIfi0MJbeJBNyThPybAhMkpiUcRVx2OnTeRypwYBuwB
         xttrMJif+0JWfzSLqll48anluRsLZnE87tGOnkDuTSrKIYk/XKcD2FXAmj/CiexnLv7g
         BwBd+lUaBFoLwc375aO2NJjwDCmTx+ngcXABBoFpJjId7Y177xoobAUtS52dFLQ+4smu
         z6a6kMCUNEG0Vi6wLnz3s2adt9ED4OqiX4+WPAM/T8y9gPuYl45JHryOeDmRrr/Ul+hT
         68LugjBXxs+ufaRDXrLo58wIvRi2TEbP8ISHOmmfjPub9xQgAZtNxFagl7wfb7Ffp/rR
         u9bA==
X-Forwarded-Encrypted: i=1; AKwUvBxXiG8Tt+tWMctNsApYidITCyvEsMh0+Z5mD/bmRmZV7zLkuB4mLkWm1icCqxXqDRz8Lsw=@lists.linux.dev
X-Gm-Message-State: AFuF++n5BiYm5dnDeZCLK29b9CFoqK6I/7izCPmAA7sqTalzLkRoNpN9
	N1Cii2KEnGXjhCr1P3EEr77s5MxHPfal220YXNvGQmIatmYuFGe9Lo5lHVUOJl0puUYa7iqdRVs
	enihotZIdrDZCwmSGKUG8sdyBQmxo+ScIudzF141nIqcA6nvZZkgopss=
X-Gm-Gg: AYBFou2PPopeonDR7wTv/pKEy4xvKHxT00tzyi4wG9FNAJPAYl4cZb2PKCd2L6Gxemc
	KR4F07+hkqgavnsndnDr84+6hpZVbBVMwUNmOzLNW0mFLwKwbIovFq1gHvN6VLW7aRVz8SiJTQ5
	kJIe+k71sPqcLzmfW33r0i4unq8VXZhsEtDixRwOZQ2XJPDXFG6LsPZK5gQzBbQK3dwn7dcdfQl
	aSP7CXHUXNYGbTXAnQ7KHgQ351yIMcgQ4b074C/40NtMA/nz+tW5Jla97PeZCcnoM0w6aJq2yDW
	HUWOjxrbMJ5xi6sZu3K4/MYwUnWLwMrYAa/L36KsQ8GbQ64BvW9Va426PEt97+47qDV4H/wBgkK
	qfRvAB3xKgpZd0gYwl25MZg==
X-Received: by 2002:a05:620a:4555:b0:934:95d9:85fe with SMTP id af79cd13be357-93a29a8d250mr214251785a.3.1789385002641;
        Mon, 14 Sep 2026 04:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4555:b0:934:95d9:85fe with SMTP id af79cd13be357-93a29a8d250mr214244085a.3.1789385002074;
        Mon, 14 Sep 2026 04:23:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296601f4ccsm406660866b.20.2026.09.14.04.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:23:21 -0700 (PDT)
Message-ID: <757e124a-4c7b-4d3b-b73f-19e7e39f2677@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:23:16 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 15/20] soc: qcom: ubwc: Add UBWC config for MSM8952
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
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
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfXzI4UIRIm39Ax
 wJWoXZEj6mvLpkRqmxLkKLdd8zxs4rtcyZBAKMAxg+s92suKBzsBZnyL8DrcTHrbYhUA7GzeXvT
 0d2tlDDwkiMD0kg6WSbAXetCLF9QBT8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfX3N8jLK0QZ17Q
 OwP0dQEpoq8eAbJbCk2AHihcGTnA9gSG9S8yksItANl6cgo7TiJ3IqWxdWgBp2UihNWI81GO7mg
 aIj54wHtI6gDwamZYmsTi+Xfb361NZ55vasflgSoptuYoQGQ/QoF/2/jEckwDSwDghCd6Lk8bCL
 /I1EiQuPcwsvkdXjSAmavEaqjDIDQQbKeNXIOwzh7zhto8Oq0xcu55hIbFe2n4ANDxyaRT/onW3
 jeMgXfP075v46QxzpkYZGv+sMH7oKfA+2/Ihyk2pb5BtITwm7VzfWTb+nrR1bzxChaeify3RhAJ
 fEl4mxvgwXlgIJoI7u0clLXOfJXlepFwfUFG+nrxEnDikZ/4l8e5qmncgFalHusDvOhwnmBo+6j
 LFxOEgMIGx85mNlcXpn8bpznN6IGTjnHx05rks7LcvCKYgn+t6l+g2x2lLp3l6wQi5opejM8ap3
 y5G3RIZsNsW+49iEAuw==
X-Proofpoint-GUID: 6yhly0t1cJJj3bioEhfeounD6EpJpvGD
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7d92b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OvtQcJRYg_U4C0nSOkMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 6yhly0t1cJJj3bioEhfeounD6EpJpvGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140161

On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 uses Adreno 405 and predates ubwc just like MSM8939.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
