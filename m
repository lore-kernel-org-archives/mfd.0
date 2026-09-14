Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A219B45198A
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387297; cv=none; b=rMRcOxKic72qYEKk+do7muxGuP5qhU5n1GxCUjHgYeOPKQmI5Q5FkYi48+/l3gG+XBz0B04hZehRqZcRkOuNRH6G2WFQK/A4UrExma4K3PpEMPom6wwr/2n3jcskBDzvfx4E7UgJ7172j9p9Nn+OXL212JEMGsXXaWJiynNvsXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387297; c=relaxed/simple;
	bh=86eYR0i6ZVOAL+yOW9gV5s1lTtVfbPgehRLwOGUh8MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0S9lMRaM7r6Q9Wu3hwYt13MaOe5hOxJW8k2DHC3zeLErnbch7/N6B9W48+QhcGI7Kpv3wk0FSdN2zZDROgQuUrrCtYKxyvvcEhJUfnZ5pBRm6e+kyWleCvossKx6nsWQkTYN3a2+DlsAYIvnPK570sdyPAFqinpHpC2RNl/jso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnamtNDQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WU2jXaYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnamtNDQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WU2jXaYP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMOO4032528
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 12:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qo6JOC6UhdyNUkaB81UiRgfAcuvaacMeC1vvdHJZFec=; b=nnamtNDQQ9gHj/1u
	8u+wb1s8mTP6JWRKxKfdX3d8ABVXd5kMHmfW4wQ9nsSyRrjYa8WkAnjy0dXdtaEo
	h2enOSMboZOQCYy8H/CFLdd9f7u0SAjuYTs6HsjKsSMJyk6o6xUB+uwhBjPWBiyu
	sicjPLoGajNYaGVa0l8fMYcMn32TORMoX1I0eqFvp30N4DUbJntsg9O1Mb2f8SY4
	vyxc953Q5FSjtqXmzyZ3M9e1jVgMce4t+MrG76KRNx7HpcRB8WhzKnbYVSsGWoj7
	x1ZSWv1V0N9dsqSCWcPL2ykRO9F2MIYBz8r5t+u5rEJnunkGwCFUwiCOgKAy+DCQ
	w4ofBw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8ehv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 12:01:20 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc3dee8aeso29142241.1
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789387279; x=1789992079; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo6JOC6UhdyNUkaB81UiRgfAcuvaacMeC1vvdHJZFec=;
        b=WU2jXaYPumYninu3dwZfvoQBYqhcX/IkKCeaovOXD+blGwd6OgeL6YU1X68AJ4f2dt
         1JpWxlzvuXuaLKUTSEjL8ZBesVqOl+jVdIRYGeHzyLV8nMMW7AAQlnXis7/XtxpqZVSR
         OUjNWYxSg3HY7rGCxEp0FeYYb3btMMqnzH52Uqg5HQ2SRXNSMR1/KAoLoIR6JFb4XSsx
         kvqrFF4A3G48rNNq3Mnzyu86TbWWCRSrJWuHvX72p5qBhe3jBUkCTmLoJJNk4F3AfDO3
         +F5bmq/s1CDTIUUBNx5CAUlP48+lQS+F5UX1LUogxT2R5UZXLBAj4RdcbV2cp24Pjk6Y
         kUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387279; x=1789992079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qo6JOC6UhdyNUkaB81UiRgfAcuvaacMeC1vvdHJZFec=;
        b=gMaxWNOE6slBizkYci4ngdGo+W+L+mC01mHjusCVTY6CRKsIcVk1/Qq6/4+gdTvqrL
         CNPYtCSjQPIb7vIsi/uje4QFtHbDcLSqMSYGZRg0c1h/FVNraVJFaG8BAkvozZq5PV1m
         aUXbGNwP+Twx0vR4oIOiEQejduyzGTonaRfi9c6WMsvlXPJAgFq6ABTbEYaPwprEqgYz
         OVHL4x4uqPgx8eLZCycoxbvV8T4rclfMpd2P9t1sXQzK9fvqmLiDonGWqyyLlh6O93kV
         XUuxfN05xvq1chMWjzOtgLArC+LndI1hquBUrSm035dAErximIe5PLezZJKVyXTuZ//8
         TQSA==
X-Forwarded-Encrypted: i=1; AKwUvBy8XIWiF4knAN6Nj+YWTS5OFDGv+eZjhSFth5tl6Re9zMQJC0WEO2ARIxzMfjNbDAVx8JQ=@lists.linux.dev
X-Gm-Message-State: AFuF++mEFBlIaF1WIAGjj2ej1yJ8EIysso9U7wr7XwPd8DbgFJK2mPZe
	sN3YUCXDQ0NIwx9Qma/Yt73cwuhArYS8DNou8zXaswPKU4MFRyDshbqx8/4+B1MaZanHKNBZ9xg
	rcZwTyBx00XfEW31m4VlorpPB9TzD4cThtAnZniZK/4f1F2qxosEojgY=
X-Gm-Gg: AYBFou3M6c1tYPvY3UjPn+M+OQ+gwJdXCEPByPQK2HiXVVTL0dmsYheHn6Z4Ryd9c3K
	5YxPOeaIuE2+ZAHG4j0Kbcw9VXkCwkKo1eXA55gHdIy2hB0L3LyFSSQqWq7A4+J/c8YglOXAzjz
	Qn9ZwkFB+g+jeXmBerwBAt2FoQlRTgWoLhsqRD7K4c+BNNjyZw+2a8KydLNffn1Koys58dog+oP
	WY9rkM7fRTDiRrOallSh9tHAWLkYQYbJrdS9bzwFhAQQpnNOLswxT5r38F2ZfiDfrQfPuY8abmS
	9QBaw0C+jxDwTeKW/1cIHbiOiHxjYgEecTrgrvDsv4xLPWIWdFsgmrtSvljx6aRHF2uysaeCA79
	xVx5nVVAAU1TDHsKG4F/WCQ==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr321809137.2.1789387278920;
        Mon, 14 Sep 2026 05:01:18 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr321754137.2.1789387278364;
        Mon, 14 Sep 2026 05:01:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4dfc7sm417817966b.4.2026.09.14.05.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:01:17 -0700 (PDT)
Message-ID: <7f3aed88-fd53-4cd4-a316-630208e7c08a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:01:12 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 20/20] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
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
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-20-0e742578b524@mainlining.org>
 <d0d7e3d0-15bf-4850-99ec-44d429c6bae1@oss.qualcomm.com>
 <42ef03e8-112a-4689-aedd-eeb7ec9b4f58@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <42ef03e8-112a-4689-aedd-eeb7ec9b4f58@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfX7fWCycF8jx6G
 OQlG0OIm53PklMxFbCBJvPAUZnDlwUOwtMG70lfZwQFE0A5bYNFdPQkMU8flHejD4cmVIXY1868
 jy/1V0YK/zSkjBI3Pz21kRUclNThmgy6UYsoNyQ+MPE+Pub+7qyWIE4U8rWhgQO4sVVxLajM7wg
 r2J/UAWVozfKU0Db14pC2hEprFiuOe/wGuAok+Getl8Edc1r65hMIJ3I/An53DSSpix+e4bBGN2
 ysglluCfxj/tecx4Bc42sL3H87o6bqjf0o8KlylJuwfOu0/JenZHjW3JMaP14SVehTNSadSHR2y
 8suPVK4D84bWz+tDwD9nE1xA7DsF6LFXpZUesX5ZdB4LnQoT5vbRlGwWKjOv1JI4QxT0EMfR1g5
 kudhzJWYe0AS/3uiUSwyOt04qFh80KeJ3IoXwoAWDr5ZKOeGjc1qHakjGQbBW044P/TiIAQtqwO
 vClVU7gXhk6gdT9GlYA==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e210 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OuZLqq7tAAAA:8 a=NPzieGulNsBdfkreKLwA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: _kj_argbP-g-JRfO7tK-JU7RxAAiH9MT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfX6BLKXcPeKtWt
 dgiRCppP/oxEoRwPmQ4gqkrI1SJa1vryntXr1xVPSQxasYCBADRIxobTGoTS+pc9pqc2bgbSNPW
 2IqHodBDY/qNmqYpC7k1kuaZAu3INTs=
X-Proofpoint-GUID: _kj_argbP-g-JRfO7tK-JU7RxAAiH9MT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140171

On 9/14/26 1:58 PM, Muzaffer Kadir wrote:
> Hi Konrad,
> 
> On Mon, 14 Sep 2026 13:22:52 +0200, Konrad Dybcio wrote:
>> On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
>>> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>>>
>>> Add General Mobile Shamrock (GM 5 Plus).
>>> Shamrock is designed similar to L9300.
>>> Downstream reference is [1].
>>
>> Please feel free to
>> wrap your messages at 72
>> characters, otherwise they are
>> a bit hard to read! :D
> 
> I am sorry to hear that. vim shows
> it less than 72 and I can't see which
> line is bigger than 72.
> Only one I can see is url itself.
> Should I move url to Link trailer?

What I'm saying is that you wrap your messages at something
closer to 40-50 characters, resulting in excessive newlines. My
previous reply was an exaggeration, pointing to that

Konrad
