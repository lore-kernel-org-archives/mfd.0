Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421607;
	b=vJw1jgELDe21CfLmJiL6+81wkG0GUcU9KGQ9YyfexZyTcY8f5dWAB43kTyOnO0Kwp9aY
	 AlD1yH/bNGwJQ1cbtOAFNG2hmkiViJy//+6WcYHHiWMLsB0GUcw9AJl95WO7PUaaZfMU/
	 NZiXJ76fXAMEq3a93LDUSKcnQiAqX1Allr15itR1yLtOSJvqsN/2BC022Oy5RmILIkLwc
	 eNMKvvcsENKsoi0eXsIbQTiKcDB69BAuIDe88YigN1FoaeFkdXw09zKzz/qtIJbVWSfqY
	 QNQc8KzWxVEqhcZ8eeXxLVwUWr6ton1VzdgWWmQetOzeIHqUritLUU40XOKhZ4WOAwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421607;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
	b=w3dpgbf8/9ajCw4lKAFGVbx0p/MLHbCMZ6W/Kr3dHfbRBODLNoDM2ZuciaT8lf5bUntf
	 7JuleISeQv3SOruB7M63hjtsNjbBpW46p+XdaG15EB77KBKTag7ommsMc7oUCxGzA3WhM
	 U59DhLxclPQ2UD/0Ifs+25XyuEjQ7kJ7GWn/5wTpHge7yhW9yWFDBmGrjREsGOJHw5rtG
	 z1IN9toIn2VKPPj31eqQjB+kfEPJ5Q2L4K2e1Cil+FXUC+6yRNboAoL1UrsknEo9gC9eO
	 xIR4ezB9HfXry2GbO6aopUk9XbD8aOzqfK2Z4b5KaHPfGKyWrPg2FRCQwkAVqYG7Lqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KLH+1rr4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MAVRAEx2;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702F3606AAFC
	for <mfd.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KLH+1rr4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MAVRAEx2
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D67447D95F
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421607; cv=none; b=YYBFyfNq+lyWNmABXJw8rESjtnr6xINeCKevzRlW/9k9BQJpVgyRC0bhSEii9lg/n5lst8NrYoKypRK97EIZC9eOXEsNpGvDnTEr+m+01JRzjVTYzwUkgXan22p7ze1Uku3HAq2WG1gVdP9b0Pcte+KdMzsWzevRCt1ttdODHwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421607; c=relaxed/simple;
	bh=G/kjWIzcC3oPmLS9q/TvtvOucNt1bc2bS8JpSzIl0VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0Egh+0kh7Ja+II6brIzKkoYMnAKHdod/IftlZHVrsH0+zn15ah8dPTAfmVmzTWPQavDYuzsG/WQwopu5doj8YAv+RUCBIGXy+KCxRuT5uKso+zCRnC/MdurUBJmNUqKJIgVhgBD48lXaUbBLU0iYc1tHt9cjcdV8/Or+rloa0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLH+1rr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MAVRAEx2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0m781457380
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=; b=KLH+1rr4147Ms2AB
	6RqJrPWDDnYZaWNnrObaXTkZWdce6WgGf6dwdf6RZJtvMRpbVtBALjuHhqez/t/L
	v8+NZMdpck17lxe7YVHLcTUw+Mkbt7C9y81Sk0iD+f0W2Gmh3r8Jshw76A8WF1FB
	Kn47TPuRTlogof/oaPOCXBa/emBdA+DOFFgbmozdUmg2dP4AeBNrIZNsJWfvdqik
	/wt9Mn8ITAibwrQ4B6NrUG24PbXqX8OrDeMABHn39MEK4IN7XztTXoeu611n2uPj
	me2URMHEocYcKfGrpgsczO8CYyA14KL+GIQH0P3warigUQpDt6zrCc+jeFzhDGxA
	XUE8ZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65hrcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179ef12a03so10620276d6.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421604; x=1793026404; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
        b=MAVRAEx2We3DPysLwReJA6W1OCg/el2UtL35ABETzJfW+2fbaDJKlhYKoGD8n4t3Pe
         hxH1kB5yxGyTzWU04dqm+TLLDpCX1pjyABJb2IbTbXOSK39ERFg9stCqZE+9ZB1ODgCs
         z6OTZhrg9GjTwFKJ4FQuybT96QxX2oR5g5utd1TZSuuNNoFn3yx8MvnCieAJgZc+sxKg
         jNmmDEPfZ8V+u6RXlzol+/bx+ooihr4gXY2UrNUxSRAKQlEKdwDOhNMBODWWP+CjGV0+
         f4N2njo0PGlklo9hJ58I/zkrRpSoOTOdZIOXpUteiTwqclG0ZR6wl3MwpN3OLoJgeTzA
         q6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421604; x=1793026404;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
        b=j4YiiVzsu7uxcdJgibbDmCiNInfBugunUOqCLkOOlCpbpuQk92M7mp6K1x0yRHDia/
         Ja6wyuEsCThRQoyVtnB16yfYwuhssVeQb+0Zh6mbh9+yNVHofrXamQa1jFJZsbYTCpmH
         OYtvzz1cbek+qhnL62gzFq17wm10XWhSvhGTI9y81izIsEAIAd1M7owMq33XrxAwuU3j
         ztnQdpwfmBUUcfXatBc1696Bp7/ikJXB+a0uFFsZz5L7P5EEuyOGthMSs7MbW7dvXS74
         jt2qdefdtgpA6cgHR4KslJAA/jeYJCbnzQ1CpUeW76iEzdpMXEFhSWjpuFVElNXW+bIs
         0SVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgCV/zupaJlbJkbyXHkwNaR5HLslymeJ8X6aGVS54XnKy5W3zy4ZwPviu6Omhz1lK+PQU=@lists.linux.dev
X-Gm-Message-State: AFq9FYIIPUu4V6y/bmpVeSIag6/+QXR30L2VdOoS7bN5raZA9jqqp1FR
	I4Q3786v5UL+1AjtyTneJh8Oyg2lK2J3K3VOUqNU+6X/euW7gbfN/T1kDVaRxx71u+AcwXGzNWH
	F+14YyCRqw+cY1ZEDMLERelN3A7J+cawUiJVve0thAMMie5VdJ/H++Gc=
X-Gm-Gg: AYBFou1Fn5OWYkfoGuP7yMECQisBu3rt77n+8oXPMZtp7jcprzxMz2y42UmGcGLudGL
	PkNEleXVkgAa/e81g9/+2vTjLy5tN+OhPXA543PbFgNoL3zjqAnbfKMwEwiovXkUte+Tr1ex15M
	LvYdWIn50sO0lADs9afrYudhxnyfUzG1C2g5nOfdVQfVczW0W5x23ZbsRHqFuKvTZOdd4AxPSW5
	viFu3XyVpe+gQkc0xVEuCLQINIzTkV1e/vkyODLL7qDwn5jB62wLC0ya7fsf8slfVZOHmZUrjh7
	gio9BExjh9dzlfyBJqKRcjNFboa8pb4aCXljHz5Xs5xg3LliYBTK4e7mA5p81TpRZzyD1tUONpV
	awiEw4gI2MYpjz7rHwSxdPA==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1426528085a.0.1792421604029;
        Mon, 19 Oct 2026 07:53:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1426519485a.0.1792421603076;
        Mon, 19 Oct 2026 07:53:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:22 -0700 (PDT)
Message-ID: <11592f75-bf83-43eb-ad51-ab3aa77df0a6@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:20 +0200
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
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX6b2X7oSeJnqc
 PqIK4JryA6wS3WiHp6VdDIFLmKAqf6um5byv8J8DgJvF9IZ0q8QmT+6FlS/aCR4VfddhX3y1PBO
 Lz6uQjDw5MnHLBjca1DKOsr4ClNE3YE=
X-Proofpoint-ORIG-GUID: ma5zi6u5EHCLuMRjNxhSo6_CaxC_LPdg
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad62ee5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX1fa2LHPzT9nh
 MQytdbuL5rIMIbSigiN/J9ZxDyxsFlaeYCIBRs7kguIZhWnPqmPCCUM/YDr+yKT20PtQqcRvCMf
 Ugn1M49fIqFj8GeifbAgDa+dg9XrHl2u9y9C5AU7IpQ8+CRavMtshmDWKH1xynk/YMI2UAXNFp+
 oV67k4LzL0vwCeJspHcjaxUukuivE0bEMqMldqnM36qSzwPUoNAK5OwBmlZvs1O8CQAWKiq4LsM
 n09Zcvly9yJWXjId85mCINaEieFH4Y+Lu/7VM1EZ5gzOLrsrQKx1UK2miGd+30KBTZCNotrYQLs
 zil2hHF3LSFZOJxQYAqoJfW2g/QKmwtmsrWqnBsrnJzeyhw/TtWL5gGCq1ifKJCOOawA8i3HwGW
 sM6N3i9UNhTFPRB2Bp4sYxrt980EoH86kVF90mrE/b95aOOgrOTNLrNqQC+BuVK5kN15iO0jcJj
 M/LKyS0ZXKJz0FIoPMA==
X-Proofpoint-GUID: ma5zi6u5EHCLuMRjNxhSo6_CaxC_LPdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
