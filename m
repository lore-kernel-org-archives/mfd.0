Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A592ECE86
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744370; cv=none; b=feHijVVp1h65IWhKMu+OTbBuVNY5NAr+gZHqKWJwL6YR+azR85e89iACD2iKEONMSPRsDPt/v1U17Bdlc/SuhEHDXHsr/afet/Ay9OYd6+uBY4UDPgEPmpnm+0F2B7Xnpi+DNDOnPNypVx8bDUnkLU8iNhCt6UmtUy/zG1wy5dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744370; c=relaxed/simple;
	bh=h9KLvKhk60wBGwe7X2Kpn4tVz7qaWBCBWsRClzb7DOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPNX8pvfZZ0K/LFYX9+3RQkENe38352BQJuok0VKotlBM6ToBMq14aXFfcg0mIRKmUZr3x6btwO5uKQ3SWF8ORLM/TyklTjneFLpAteY2XfotA7WAecXW/mG+OD207UbaTcc9oz1XA9OT8b7YQrTmUQlnmEgqKzoI4yjvUcSd9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFmgGIgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LX1Sx6jx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFmgGIgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LX1Sx6jx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MHr5oO1506650
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 18:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=; b=kFmgGIgyTTnu3g4J
	QX/XwcbLHZCQy0lVElgeHDP0QIRCH9tb2meYXOaP05BogeReg+vVJrXOWNJytY7P
	KDNkbYz68jJjFGumx3ekIdQ0176FhyLh7czPCk4iKOEPLzQKr5/6E8rqmqYdmzCp
	bKHpomqBTOlSGIPRzhylXH3rVsSnl3xxc7aYGL9J8WcHeZGuLYxbmmr3HuyEV6va
	4q+NZdw8mJRLzzClol4tPZk6AjyhdWImMC7h3B0pcAG6Cib7n96uZX4zL1AQWNA1
	PDyX1BgInUzk5Ghe+3AsQ8VV7KWdHksy+OkM32dqgs/uuJjzvfwS7xlr6EoP7+Ax
	6lrcWw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm11cyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 18:19:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so19758619a12.3
        for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784744366; x=1785349166; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=;
        b=LX1Sx6jxCN8FlN57F+6aCzjso0+WhCRrN3u0KUUsGfedkzqrBA0Xgz7CVFCLA2OXB3
         lpeXb4A1kEYWwtgrNthhBjXIq941czVA5MunVq4dHhvU8ypxSJ6iSdZsRGH7bE/eI323
         ArQNSnAwSuydkrFuMU5JiEc9c8RE3XPWy2olv4/QK69O2JVJXfFJflE+XmwM7ZiwCl3D
         vtatL2bIB/eXf5zG6D1c8fUwBAicHzSf2sub/tGo1eyyA5I+Gw+ahLftq4Qa6+UIzWyN
         /+679HogQHR9Ie8HGRvG6VanDs97C6ecuAZdUtW2qI4HsEJWf6e7hLk4y5hbF6si7tjA
         ZTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784744366; x=1785349166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=;
        b=R4lZ6b6ZXd+w6BhxqbGcyVdRiDOJv6r8q3b/bkgDXuAZK5g+sUNUWudeqiZMABt7R0
         2hbMfkSgB82ZmxYa6XifAokgNDm0sqKGGG46uywRpI89IP54UMVZYWgWZD+R3WRuWCjS
         V5CnH6ouCSzA6tlCBux8XH2Qc2Ty0H90wHyDsAgnWvOcI62fZvQnqxaqOuaJaqY8Fy4u
         6EZfQDDDK7lo//l5C4+yWJe6u0u1u9iXGM/Z0OsYzEsfokee91Xzy0EdF08pMBQZUQKH
         JjkVh1Os81pT1jkvV01P1w9PD/P+yxfCL2Egc44LKDIkoddINFkaplU7nIUBqySmBaAF
         zJnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+QxPU+4dNtJRmQ8brtUDIUx2mRrcvP5lCQpBbhFbBl24Q0bB7Hnz3mEsgsbsQdyrKF5M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKijzJ99TXRB5elO/5e2D1l+O08Q3zHikVLIHK2EsAZjzpG8tp
	RQKilYsvl8D/DTmX8E3VtQVQq0liW3UBby+plmXOYjNq0uZ+t62ExihpkNN5w0CE6k5yii/ev5f
	iBgnkXQH/oQanhg+B/Nlbmc610hOpK7JneuZh5SkJxOZvNyg3CMcHyfI=
X-Gm-Gg: AR+sD12+ainC7ZNW352au2VFw9Sr4Wa13tSRiBhUD+21DoUzYLxroDqkFy/HcRtf+4R
	oc+tvyUKm43qo1REPChQ/crr5+/lrL4RE+1rYJgJrWU3uahe6ryxUrEfAHmQloaO070Eq41rzea
	vVVtv37ujr4hD627CzmplfEL6fry+46XztKoTSVJsfX8ejMb7Teq2Qzx9eI37myppwophs4jq2u
	fPtLRwvrtmElQ2GKodBtY3q4cfaaZgy2/odeGIywg9RP3I/6YY/iBW7u//8+kDZ7EYCvy6g+3Gb
	jgHPX7S0LRVC0fYShQ5VX7tSNRvS0bHu+nLg9oVXhw7Um8teo9xb3Upl/Cq+0zaIV/aEMmyrRPk
	LQfziEanL1IQBcxdqn97WEYtmzTw4Rgbf
X-Received: by 2002:a05:6a20:9145:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c3ad66828fmr26270279637.8.1784744366193;
        Wed, 22 Jul 2026 11:19:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:9145:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c3ad66828fmr26270228637.8.1784744365633;
        Wed, 22 Jul 2026 11:19:25 -0700 (PDT)
Received: from [192.168.2.3] ([49.204.16.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a87e9sm7813501c88.11.2026.07.22.11.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 11:19:25 -0700 (PDT)
Message-ID: <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 23:49:18 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE4MCBTYWx0ZWRfX34oMPV3oqEYn
 hYLyMRxweUvcU6mMuH2wYP+M7iP/SvOALc2mAqH//pEmAPS/oNTbXTTdOWe8/IBS/rzX6Fv12sL
 eZskPvVofpqWk+wGFALs6EBLo1bJiBg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE4MCBTYWx0ZWRfX+CviKkc7VrGu
 KHoOCB9TzeAmPf1T3oY8tshiqXLNJeY//d/VbejFT2lmKQaXFm/vX0ZyCMStUePddsyPmeXoLws
 4sQsnQAA6+R3QkCeVUD5hG8imOgtAJ0UVkOin3OkWd1cUacocCLDJ9kGxbmnI8N8MeFahSEAIWX
 eMEMz07pKoWJUDdowNEb4rWYQtOKQWgszAaLAl9F3GwC41sV5f7rt22QP6t0cjwtDQUmPFBKKIU
 WDLDdcNOrNxEvyJdips2gQWFf7rKiDYRsOwLpHahhCMDdaxvMcynt+UkdOnzvc+u6I/KKijM3iG
 yyRxu5InhLtncYyK0adDdJPfW4pdoMXfj8xEt0x8sESHD7msFqgsRruMH8tbdRcpvFUyoUie+jG
 0T3Y5IwF0E+ls43URjsuqxUxDSBAat3LBbwIp0PJ1G7nw/U1VRx1Qp6pGLUJiyJpOxed7W/asHA
 lAjtEN46pXTprc4mARw==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a6109af cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=BvtW7Q8lqb1UdYndl6lHrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e4paWlehE--IC7SGyJgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 1Lsj7wdnTguaDbfLBU1oboV1wukaynYj
X-Proofpoint-ORIG-GUID: 1Lsj7wdnTguaDbfLBU1oboV1wukaynYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220180

Hi Guenter,

On 7/22/2026 11:16 PM, Guenter Roeck wrote:
> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
> ...
>>>
>>> I am curious: Why not use static initialization and use the is_visible
>>> function to determine if an attribute is visible or not ?
>>
>> ACK. There is already a comment in v1 suggesting the use of dynamic 
>> allocation based on the available attributes rather than static 
>> initialization. The intent is to avoid having to perform enable flag 
>> checks in multiple places.
>> . >
> 
> You lost me, sorry. There is only a single is_visible function,
> and its intent is exactly to handle situations where some sensors
> are not always available.
> 
> What would be those "multiple places" ?

Understood, thanks for the clarification. I'll revert to static 
attribute initialization in the next revision and use is_visible() to 
control attribute visibility where needed.

> 
>>>  From the earlier exchange I had the impression that there is a large
>>> number of current and voltage channels, but it looks like there is only
>>> one each. That doesn't really warrant or need all this dynamic code
>>
>> Yes, this hardware only supports one or two channels (voltage and 
>> current). What we discussed earlier was that each channel can have up 
>> to three threshold alarms (warning, critical, and emergency). However, 
>> the hwmon framework currently supports only two limit alarms for these 
>> sensor types. I have not added support for the third alarm threshold 
>> in this series to keep the initial driver support aligned with the 
>> existing hwmon capabilities. Once the basic driver support is 
>> accepted, I can queue a follow-up series to add support for the third 
>> limit alarm.
>>
> 
> What does that have to do with attribute visibility ?

I was only clarifying that the channel count has always been small 
(maximum of two channels) and has not changed since v1. The earlier 
discussion was primarily around the limit alarm attributes. That said, 
you're right that this is unrelated to attribute visibility.

Thanks,
Manaf

> 
> Guenter
> 

