Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789E3DCDAC
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031979; cv=none; b=WxNOXR3WKhVN4tywN1Yx3VDzkBK91YNEe1+pza14i98ogrdZKKwQj3rfBvhE1gLBtSwtyT11b/4O5IeUt4X2yeGKsMoG3+c2Sr4uQPpfxEZ23BJ8/Dp7iVu+kxmXTut4rshYsG+pPOoEpnruF/YTAoZIbzK2Eh5LY7xNakiXSsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031979; c=relaxed/simple;
	bh=ESXLYzb3JTJ09wZ1b2tTlT3LLVkVF6VqP9DwTjEEhjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ek5X1VsrRFJK4co+mtXIS6D0wSEcgEwufu3M9SvNV0TMByE9wCfl+uCYb79Iw/pU6CsGCU91Nld32RWlcUwA2bjpYA7MWzeVWVALRixyQPVzmhEWhBCC86UXv1GmrQlZKkrw9oOXp6OgQiscZdI/hlzK5zsCmArqkOPCeOkgilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHhhVjrN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idpeWhWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHhhVjrN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idpeWhWA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pwuK3998383
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 09:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=; b=jHhhVjrNUw1iOuwP
	yx9xHNU68EVXImp3wcBTnlUMPowCBALxxLu6a29zK+eRU2e5Rm6255/lU/M2YnMh
	0dtkZXQ5iLZozDI0a9TZC225Hip/C5slJdg3c+j+EYKVntEDA10rtL/D6smDpSgC
	C2xD+0wdCfiXGEKsE5rMXEgdb2sMKzhE1/YUs98HO1PAdpY1htoxjElG4uMnYFua
	SsO9aV8pGlm6/3twZ2PG1Wvua9e6x4iMwF3ySvg4FqXj8WYqhhAqtmHUZuu9uKXm
	1QSyhq4CRUf+dYbJ4aHu/80efzlJxWWvLCgG/DQmOWCjtCkrJHp/0oHcg77SnbH1
	MnrA0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfk5gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 09:19:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so139571985a.2
        for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 02:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031973; x=1789636773; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=;
        b=idpeWhWANva6OYsCj0oiCXeKHTALs6cHhiopCpo2/r6F3aBxGQ8+j82/ZJSgPICzpg
         oa477kjyOMpiVk8L9f66eiASlZz5BHBnUu09D1jLMV//4RoQUJr91Tq1EojRRNi1Nhr2
         dHsjlxChImFIZQ0f0Sm82cuvUCH+NwxGuwfVSfUVxhHc6L5bYq8iOJm4HKJAz0F2/aB6
         cEGbTFc69+vk/deCC28pDRMqPIxkFL7yi3lGbOSLFm3outf+k2KyRNQ0Ic4h8fGZeeFR
         zKgb3MfJmCnigoxYSaFTvnR6zvP88S0LgU5/XKhduciGruc9D8HlEc206SW95ZOYMm5Z
         n0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031973; x=1789636773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=;
        b=rzyjbD6i0xI/GqGwGlbgQTcU8obhhu+8lfkgTZFBQkR/6PiaogqFf0rknXAk4hd63E
         mgF64+YRfbfgtDMeQ4Wi+Ti1SvodUvDGe3M+SDZxJJm9En6P/cYxKPUYds9CSR1S717u
         0M1LdOnv5MnQHnU9AOoCib2mJVdvPmOfvLMvjeO77capVEwnlwa9J/F5TCs7UG++J9nH
         JreDfzTmxSOukyVi+6MZ4Hjmt/YHD7vYrL5CMfWevfs2tO2buCB833nX09vap9GHuU5Q
         eBvM9Of41XJazq0MJgHijWUoQMbsuw5MWjPrQFsCblTJ9W2mK9K0wMLID9jD3XBH+nP0
         /mjw==
X-Forwarded-Encrypted: i=1; AKwUvBz0Z9f00rpLBKOeKthbC4KBseUCgOSC8Yry8QBl7yULYMA5l1jF/2VI73yVB8kNODozNYc=@lists.linux.dev
X-Gm-Message-State: AFuF++kxmF5b8fcLXY7sdctlsEg+vAUxi7AcJXEJAPcbpSSUALR+QsyZ
	MpQ1BnvBtXZrMi8z9dp0RZ/KH+QSInX4exlD1kKkd5X4CvtExS+AhIms5BDhDuKk9TT/7F7Z4FP
	lRsBB1lY2UJmK+zn5Vd668pwhhvyUEX0Wc7V6BrH30iOhHvTcZQ8L2WE=
X-Gm-Gg: AYBFou2jVW1S9R3dTPsT//QblUO/FZ0Zkg0IG2oe+V1xpst4OdvJDmq/8CenEasclWp
	sqBCYusJZU/GMQhr/tADVUQ0I/dEYEyjrSErqEguctc+0ZosFS+QRC3PFWLxzG9+NYHdf92u7PI
	pbDfIGaKqFHOMPaw4shaxGGcWq+rJmToFCCo4Hs0uuQ7a3t0hz/jTJSzjHpsvAfnmlccToIuMne
	bz+D8Q9ha2+2NYb1Ms9iV1c3UvU37o2VJfZUzdGRp9nzoUTZjhPTBlFMFiMUXVgJKXy7Je7xQqg
	VAvwKXCOwy/9JY+Xb9h9fnd+TTMd2NSPVdPvdencs+KQtw6AhMGWgFMMUaEQ4Qi8NVQsuxChNqh
	k3jJILzKNmYzha+Bp9+bxbw==
X-Received: by 2002:a05:620a:2815:b0:939:7e96:d296 with SMTP id af79cd13be357-939d828e0c7mr425484385a.1.1789031972861;
        Thu, 10 Sep 2026 02:19:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:939:7e96:d296 with SMTP id af79cd13be357-939d828e0c7mr425479885a.1.1789031972468;
        Thu, 10 Sep 2026 02:19:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a98505ec28sm2830486a12.16.2026.09.10.02.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:19:31 -0700 (PDT)
Message-ID: <6435193a-caaf-49e0-b219-ba91230014d8@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:19:29 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt
 line
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>
References: <20260908130745.2545-1-okerixx@gmail.com>
 <178887481187.4612.2819576206036967152@gmail.com>
 <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX2PVfqI3CxW6h
 a1EzZ7KGCAVt3chFRS2CpYzIN+CrsJTQ0KHAQoYi+3xPMoomzwmo8VfqCdCM8aQegpXnhhS0iKk
 8DBI0avj0DmsUzjBVL44UlrutcZ3EV8=
X-Proofpoint-ORIG-GUID: uBiW3upNctp4tSUfCGE-3EJQsKUVqB0c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX2tUM8vDaJyxm
 4ZhHQTFQK0zR6OR23JlxPAPFMyVMUJQQlx0XP5ah6ja4apRh5aw191bRPZk1v+q6MGzcYT/JuTj
 1xeFkoEJ8Ln6+aRWRLu85docdZ777AgkQtY2S6JciuSgC1vVREBtQc2aml1mDlxn7pzrfRNjTTL
 kSm6bRoIpitvCJYTrRGBCOGuh9HSOyGm0Pd0qCZrC2kh0D4ofYke+O6fO3g9PLdyHGsomZwc9hi
 Wkab9jXcTa0wC0nAAJPhq1r2APNSijKVfb+EI602Igt/VaUSMxD3O3lnYA54+uQminVuD5aHZga
 N+OiHfJ5oXbSFY1NygAyfU625XX3qU9N1FZB4b4kzb/FHAELjrG4r9CDr6VBAjFiDwhj8QqB+oP
 bH3gJXXspcHuZcIkPNS5ulzjzDn76+wZH5dDxGRr9coHqD/cZQSsOuuSucep+1BCO7gAad33L4F
 R+aouWrwkqW11gGNyVg==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa27625 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=oIgkIcNInMogrUYK5KIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uBiW3upNctp4tSUfCGE-3EJQsKUVqB0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100104

On 9/10/26 11:10 AM, Jishnu Prakash wrote:
> Hi Oleg,
> 
> On 9/8/2026 7:10 PM, Oleg Keri wrote:
>> Please drop this series.
>>
>> It duplicates, as a strict subset, work that was already on the list a day
>> before I posted:

[...]

>> The camera works on my board today despite this, which I would treat as
>> luck rather than evidence that it is harmless. It does mean your series
>> fixes a latent bug for boards already describing a PM8010 as qcom,pm8008,
> 
> Just asking, have you noticed any boards doing this currently ?

Not upstream, I don't think:

$ rg qcom,pm8008 arch -l                                                                                                                                                               
arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts

Konrad

