Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA3E4DAFB6
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055479; cv=none; b=MKm+/UJQ2XtmZqalAQooUSPc8ugkGfqoqGEGK8qGBuL317Bg2rNLd/IRv5Jaws3sYV6LN7pi5wB9WqU0ElwT93Yi09GgSvMSO8V3CHZ69izIsJ5hF6+JLrt2beZQgN/3kdflnK1A0M2FbPnvEDXQBTX+FyvB7R8QhauZA1PFEkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055479; c=relaxed/simple;
	bh=ZP/V+XVDi3VU7pwiGc5G664R30B243PanFs9BryZBGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayxq8gP3JlMfNRqjSLLthbz9EyoW1vNIYoMDXW2jFyiJT5rGQxJpbPUxKLJU4TLfvApYRV2Ebm/9m/gYZtGHB8JPjGfmwpgmo27Y67C8WRovNwrSV3WrvSXZkcn3djWBSthuwKyLqZZev93rpGWtCVQTjpdse/V+gr2nXNPIyz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AogNQwqA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTToSzl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AogNQwqA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTToSzl4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xZHR2738645
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=; b=AogNQwqAZL9D8O1C
	72ugis4zGLSjwVmVlHqQ1Uw00SWq+/uokvuCnwPJ4aB8NypSYZHZeJDIwBmctMpu
	6lNEHwWc0Fj/+qoWLhn0wuiomkYXSJ9ZyzwaAqB73hR4kFiUyjwavYrhCRtcfwdh
	bXQ2km1dFQID02/+ouh+RwxshawH7jPobd+xw+LD+/tLOx9l71J5cLA9NcXaS6JG
	E3fOykxNof2Ai+Jx//OIEpucs3aQpydwLi6seB2vSX+y9P1y3lNLc8JsYbnZdU8Q
	Fm4sRaxUSfXOeEqHd+WLyF8xXWXbrIRLpk5WStKRD0i2/7dFhMnccPSAV0z8q2go
	P0JDrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds96c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:11:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53568f05f8bso14690731cf.3
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055474; x=1792660274; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=;
        b=QTToSzl4x04oke+ZGyrTiMv44T8ti0eIvH3K00xYtqSqGm7fRxQ2YKwcwMg55Eac0d
         FhAvHAvIKIWxUWuV+JgyRlSQDTBG+ELmWcopf2Z29vA4HA5u96ytcA4XKSb5+04Hm92w
         UDOB0cgU+d1tkvKiHxmnOCdDKmYFagqcaIP93HZ6mD6306OqPfg+IqNMixC9mdk7WLca
         D0jAOaw6/4EiCynH0fsB1J84aUf3aNl1witolN30laIFvBewuIVNIYYiA8yGR3e6K/Uu
         i3APSSn4ifcLPKT5mM81A32bIBrGQlCzbji+IP9d5r3Fd+PwyouR89ilajdh6R0Eo6AX
         LXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055474; x=1792660274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=;
        b=vI/svfiDGSaLG6ekFhjAB+d5Kp66KGSNfuhE8Y1mSolrLfBlPEOJVFkt+TtgrkyZa7
         Hx7ivQ70vJeWgTTfg/KzYSnnWCC8XGOO88QYOrUugxwxccYZPTCV7ysHmI7swYNDO7Ha
         9OSYUBKMxiJNPRrx5JR2XrHPiuJzRITetkdXS2Uj68dkjbEHv8kW/IbdjB18v0Hydwi/
         9EJz3Ka/3oH524dLW/66wAFvagS6AsjB5QW14ZMKXhMf6thSnLZ/BuW4vTFz1WZuyQ69
         NQLivAjm/O07sOMqvlRjH+GQ8fLBHIjtOoYr9CUjZ1+G2yV/nEwWm+knV9zi9b8zVpEW
         afEw==
X-Forwarded-Encrypted: i=1; AKwUvBzhYy2dWF4y9Ro4EPGc7o5gKBiGYIMdlB7NJUpQwiIEK8MSWwX2C+XImF+5OaX3AAaUYfU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKXlAU+lN1TItzif5+Y4Tkjg60PE29BaRB9GW014Mqehxq4dLvD
	n3wDSJkVIma2z3pw4SnZFOsVNH8cXGE6pvA2zQbAcL9XlgmmzpIN5j+c6iA+Ic4y4fCMeUC+L6h
	iEf1rZj4GOO3CeJaXD5GDdhnD+pXrqIsLXDQSCWnkiLV2MvzARp1ZzpyHYeiaqEA=
X-Gm-Gg: AYBFou14Z/yaX7h4R2kE80LkMkza/i48RY708nJG5tHGZJ7hX/hs5knDXq7neac21IQ
	ppHL/XknqSdmF8ynoZTbF0+cxZDmorMvEh+TCyQSGacObSvLoww0uhcTp2hqnwBAGa2TMpo5QqN
	SyY1vZuPTGy3I9m/XUw4fhTxhX4DVcm/er9UuCsvNo3GB2sx30fXT92OrQzcnHZlKWQiyeE+ILm
	fx63JfLXfTGwBrK/bMTrE3k+wkg8t7SkFNeED0rSBIE/almQWSpeZKl5EywKv86zCSduzDzI1vA
	h63ZqLslZlA244P+jx9mCGxZJyMODbk99MyeJyfkrbZHpK10kXgQRT2o+DSTSmK8KfZ/m0tfA+J
	4KuPDkvz22g5sNSbuwyWLew==
X-Received: by 2002:ac8:5f87:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-535fd164be8mr94188121cf.5.1792055474103;
        Thu, 15 Oct 2026 02:11:14 -0700 (PDT)
X-Received: by 2002:ac8:5f87:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-535fd164be8mr94187711cf.5.1792055473655;
        Thu, 15 Oct 2026 02:11:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab11d7bsm101289466b.83.2026.10.15.02.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:11:12 -0700 (PDT)
Message-ID: <36e8a372-3a4b-4466-831a-2445313dae51@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:11:08 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
 <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6ATcNJckpjvOZZWBFpVaOXOnJqjo7gnt
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad098b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mAFRzXhWWU4R2_A-WnwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXwfJouAOdI919
 /HIvOuLWqC03rL7MxCHFejEQCbkkxATY7Z2Q2PqU6G3vuhoN1HDzbFqfa4+F8nwPgxC+/1ens0a
 7C/wNqaGYx4huwZFvXqFxi9PJHrLi+xAP8aY0/4Y029wuOrBO/3qyEiLVXL4hWyXcD6cGLDfPJ9
 q/ocvH08gB3oBFlkXZvbs4t/hPXRmcTGUZHiCefOreFPKbpDX0Tr8k9jTNFUthpT9B9ej3B3Deq
 Dt8wMOwqnV/5jckyCvTuZORGkrSfBEm4xbXYPutQ3VpzxIrmXzyFaQ7U9Z5+9UBkdXcVu4jcQ0A
 rylZznDqfW+zkoAKdtSPGpFLnLwcJBGMnyQiyM6kyQabld1Tq25LAp1axxRzL2vygdvQ9urqTGh
 ja/b1DzQZu4wpyxwCsMZMILjLsP7LvUdJ6xqxTnvZyG4U52XkkuhvvdHHPZgElJtRaeVysihg+3
 X1GFdiqSfYWGSqd3Qzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX+mcE0uZtdGUt
 70kPMQ+Slatd4i9b/e1ktSLTYOgU7J4tXRs8UfXIQFpaTbqLxA0gPvcIaQhi9T80jCew2h+qfJ+
 2MOPJJUKSOZRzEc5O/aXh8ABucfYC7w=
X-Proofpoint-GUID: 6ATcNJckpjvOZZWBFpVaOXOnJqjo7gnt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 11:10 AM, Konrad Dybcio wrote:
> On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
>> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
>> the wrong address the mux driver fails to probe, the Type-C controller
>> and the DisplayPort controller keep waiting for it and the display
>> subsystem never binds.
>>
>> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
>> Assisted-by: LLM
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> Hm, there's an ADDR pin on the FSA. I wonder if the previous guy had
> an earlier revision of the board which routed that differently or
> something.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

oh wait.. the previous guy (author of the Fixes commit is you.. :D

Konrad
