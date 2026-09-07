Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14614466B75
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777749; cv=none; b=onbxjMUSzZObxGZLIV9lxl7oYw/lP9P+Eo9/6nXT/vP6a3AH9wlVoyhhM0z6ACe/M7XfD+p8gxo9oio8iNtch9QpRnc8zQYN8t3dw6C5diixyBB8MrYCq854h9oU5VVjTgQpUF0VxgS69xJs0TNsjQzy8L4t/T/nxOmdaMFgw4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777749; c=relaxed/simple;
	bh=ozR+N+I1Bjiuz4/cQVCEFoCWZJrPMxo1R/fIuMpKg8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOh8U0esK1J309iCiUJwMCYtaO0EiDO84Vduq55U9i4Rfx1hrqI1QEfDof3IqJJfU8u1te4mOug+mpCcoN9yLkSzxs23LJYofyfycnwgyzTyi4JXrZ5PivRqWMO+o/1qTm/Md+T9uSk95Ga8xEuDywc6WkDGhZJttov1YGvPJtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFoXXChX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJJxoHBU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFoXXChX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJJxoHBU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bWht3713211
	for <mfd@lists.linux.dev>; Mon, 7 Sep 2026 10:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpyEpJBVtSyYB59cPODVufFyZlVpTWQhTeLIXPfAKSE=; b=OFoXXChXRPt+8y1t
	rCu9cL1pFGKGkTKvKxdZBRV246LUlczAHolkAGwlz1CLhkvfmPJBwd7cKR8xCal1
	tyQaGXQ3sJBf2SQLq/nHMv51KLJxDmpBvRyqKp03MyCQ82PCVb8UguX2V+r/iIwU
	uT1H2WjsrGqudOP9JCXb4sZg0xSJtyTK60AAmkTD4brzfbiCwxL06IQg5OO/aLtm
	Dd/Qrqbwymo22eh/Z20F6GNI6hK6KlOHYyQKZPVxnff8xP5dqXVrT2YnQaD6KUf7
	8DPCVZHqJeHXccoKfoYJhTjdSWHOCvt0Fi/dWKOnALyESzp+pqKKLq1DYCCa14Tw
	PjMpGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1mn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 10:42:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so5443475a91.3
        for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777742; x=1789382542; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpyEpJBVtSyYB59cPODVufFyZlVpTWQhTeLIXPfAKSE=;
        b=UJJxoHBUtUkrEHV0CHufG6OR23gAXiA0ptgXo3UMGI6dP8GMSp9v7EaFyuGh/AvSJM
         TLZuRTan3jwUDZFX0TBdpKOhTyl5+qo9fBmpMf41j7Ud94bvlxPOkW56g/wOT2dDmcEd
         UIgmVjpfhD8Zy102ogklTmv1GtO6J3jPaakabY9i64cBAzPlHkZEpFPM/SLQmgVYrY6U
         FQ5lK4c1rx+RFME7DEXQAeNLuUzvyxYhpHpd32S80qPCtjgK79c4VjbBSS0DefXmIlAc
         XVvbob/nf6LuzIryukE9Q2GTMsGh9ymBaK/etl8E8h5aliNqIOzvrGEFBFzzWc7dZQyu
         Skyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777742; x=1789382542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpyEpJBVtSyYB59cPODVufFyZlVpTWQhTeLIXPfAKSE=;
        b=boLCOmMpSpax3rtZLyBs+cCbGiaE6pouEkjH2iy2IpbzTx6dWuRjx+vN3V0OhZk6IF
         ukwx4hjGY+CxmuFMwnoxNfE/5U8Wxqq6DnqqR+N6bGbWxEUxz3xkZ4oPEKQdcQFEaKtW
         BOi7FIRI5a36FKc/7BfYTii/6/LPuMsLTnRY2MVZd5qCjNJKQUCSjZRJ/CqQnsS6/XLu
         Jxbwusv8pIRdB5YWv6VeJPJL9Xif046uqQPjFnvErMdfLTZNPKCE4twYUl5/l8kD40i2
         vrqfxyZVOGX+o0Wksa55NAAC+rccsbIMNtYdIq+KBUC299nfBFAncxFKkFFGeokPXl0G
         qxIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL+RZYPMH0dPqhoe78uFoBWWvF4XmpmAbL2dyevR1PCbRUYN5ua2eQ8ZgAXCo0ovYRChw=@lists.linux.dev
X-Gm-Message-State: AFuF++k/BpvhwusGLY6KVpqdWbCOTSi3O1+LSQY6DemirM4AAevMqYXm
	WgostKkXjZqpSMeqz+/poqZYFBuceyuxapXXk46p5OXLA/VKvtL4sRYGw2huaU1YqOyPDku2eJD
	AEZP8yj0KT39UAhKFPkMF9f1xeVJUGPqLUVCS6YfnGM+k5jcurdyqrDzX1XA/VUE=
X-Gm-Gg: AYBFou3+UqZBVQFtz42FyOTu//vKfoHutve8MkiMQAPJXCSiNqqFeuQu9DJgHZ/VNIX
	Fh6AcvAFvzpk6tSp2wV/GgMfoVEEq5YiDs0RJdf53g6WOCUN8S2dWkwOSt52SiM5eYb/pwmbA62
	jFBE4OtquTBBZngwd+YyIgIoQUkHTUeX+f2pLdUQMMNV06x61Z5UEe/Z64hEZuRLAVmdU3E4kyG
	kZsdO3dds27f1/nDVKWEvx/3fredBpMU+U2RdXOmd+AUiquOR4glGTQD8Es6bcYssEHd2blf9cO
	0JhUX9V6d6zGzoxgL6/J8XgDl7ELMz7uBenulL/ZpOcLxWNltCT6KobMhHEuZknwIitgWC3a2IU
	0fJBpcOBaA78Vbx1co9v0XcJYeAAY
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr31098724a91.13.1788777741849;
        Mon, 07 Sep 2026 03:42:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr31098665a91.13.1788777741381;
        Mon, 07 Sep 2026 03:42:21 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm35559357c88.2.2026.09.07.03.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:42:20 -0700 (PDT)
Message-ID: <9ebc94f1-3ed8-4a21-a84e-ccd46f044927@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:12:12 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <iIEI9RqdlqSAwrBGxsv48s_r9QoTRP_IPoifu8PCol261xGqyCULXGQaaMYndhNAFA7YAzraXTr-UzZhguWz3g==@protonmail.internalid>
 <20260907-glymur_camss-v2-2-75f7982dc983@oss.qualcomm.com>
 <3e619085-3311-4acd-9493-e849875563d7@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <3e619085-3311-4acd-9493-e849875563d7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX8+Kvt0BK1d0S
 20N31WUOKyIqdt+0ifNGP650/ux2oTwiw+MYoBl8EG1NcziX+PhAvS/BMcBe55T7Hlk43lTuDy5
 y2iXv11I1IFzFAmkt3H85eHULnikpgB1q/TVrSKegrRjbtBLx2o/mKU0TFvQtq9E2Aeyrxkouz0
 QrIrXZDifnpvMA+BCLnNVw8Zpe+8gc6T7vFHRdKoiLTJu1ThtmGnWfTM15OK0qVS99sh8j+iZk4
 tL/h8kWikH3P+d7Sf0YWnMHmw/upswMsMk273a1duJWop0lKbFk8fpsu56PNbwdYtMCvUzY5K4u
 gKGqVYUUH0jSUXFVi3liAeBsbz615HwvH97QhRjdGh5lKEzDeMQHQY8vAW2MAdJ14L+ORBWfpR9
 DExhylFiW8e0LzRg7x55pEsAeJDwPl9BBgJrGL5WhIqMSvejQV4qI6kyw04OO53GhvMLRzcq58J
 Srck0mJ8KbEf9XrkBfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX1wEHe3w2MEvs
 x3Piyp/l1CB2P376dmPvhrV5pcKiqoL9qcfVCay31bNeOtr/i35GCUSZdox7fuaTD8haofBO7or
 nKcQAubz4z+4p0qLSsRIqIr+FfPgaRA=
X-Proofpoint-ORIG-GUID: Lnldd9fJ0kFiOCzFFIi7y9XgSjcEPefN
X-Proofpoint-GUID: Lnldd9fJ0kFiOCzFFIi7y9XgSjcEPefN
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e950e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=trIvJVA2E7aHKB3H3pMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070117



On 07-09-2026 14:59, Bryan O'Donoghue wrote:
>> X1E80100 supports both the legacy CSIPHY resources and the new PHY API;
>> Glymur uses only the new PHY API via standalone phy@ child nodes,
>> so per-CSIPHY clocks, interrupts and supplies are absent here.
> 
> What's up with the commit log here ? There is no legacy CSIPHY in this.. ?
> 
Right, Glymur has none — that's the point. X1E80100 supports both;
camss_detect_legacy_phy() picks the path at runtime by checking if
the remote endpoint is a phy@ node. Glymur is new-path only, hence
a dedicated binding without those legacy properties.

The example shows port@0/1/3 → csiphy0/1/4_out; port@2 is absent
as CSIPHY2 does not exist on Glymur silicon.
>>
>> X1E80100 has four CSIPHY instances while Glymur has three
>> (CSIPHY0, CSIPHY1, CSIPHY4), expressed entirely in DT.

