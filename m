Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C614D9573
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062028; cv=none; b=ONxB5gyiAGafsr9Yz0ib22L0z/Qq46bB1rZeQVhMQnx5wrzrJRyxncUkBnSZfRYHpc5ANWKIScfmbr3KYx7iMKr/1f+35h69i3qVWrsHK7YjddpuXJbVgmjY6t+4ge1WTuaoBwNlfY5By3V61spraGxyYNrxGoDuqZB8VJHezno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062028; c=relaxed/simple;
	bh=rBYJ+VBooPiZVjyoQritmIrBDC7txb3ZU8qUUwQjDyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pc0X0bTt4KhH3CNciXNspsQAvqLGPt/fg/emqUTYMC10lPTjqmzmdCu32o6KagKhuSARkt21X4uVOtXrvV6LQvLquI2pXpB5rP2oJqb8CWX1y8FgDnAH1sJLaYDKlp76o5PWMgPDVEFhYF8L5/tP9QKdT81v5bYeYVzIZlyZFDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9HO6y/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvqrVNKu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9HO6y/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvqrVNKu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPp8O4100543
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 11:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=; b=j9HO6y/ydwVkyQOZ
	K8H62hOQxCyXL01kFo4Cp+Ga69p5a/kYJYfitjkaFWM6nrwxHgR77RQ2mqAZ4ur8
	9MHoSRTgy/IviyWUUIAbw58xUl4vBiKIoaB7pxxzULpV4w3K2Q6NnWPXOXjkmMEv
	ZZdfFtaWmC3ptr5DJ74mB43KWQHAkf6leg3SA9moBzm97wbWFQ1+NxJmjHWnEdNB
	dfy1Vcn4qiuJNApNuURj7LrcAveB3fq3DpFL01kBeAr5QQS0AL4K/G7SwtISwoHh
	zvdaTiOLykLu1FWwkmIpJBLkz8w9r7Jt+ttmaYToZrThrYeMqlFg2H6C+SZkSgFa
	arFHzQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r842v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 11:00:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3e7a65fa8so1542090a12.2
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 04:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062024; x=1792666824; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=;
        b=RvqrVNKuaGZq0oTpTHvMtNMim+I3umr/bw2hPDyX1Vocx5zcVIela0PX+O+xUlQTsI
         gTy9OYpkgS2m9T+fHFTIavDP7fpmKVCKmIzLgcqZb5NJPBcpJmSPmRkJCFYlSzKqQOI7
         E4u0knbZdkCgj9kIR52nUm+SVEAfblTniGwBvieqklfoEePtCwRivXCLWnb+eH149HxQ
         yiOZpxWRK97j7YeiBJw89kLsBfvuonqrP1ASXK325qdsBJNDUHoRTngPvPNJdIG/zw9Y
         URsjLPP+88FOJH8s/M848jcCnwHu5Tdzua7e6dug9OX0ttX2N7wHayMcOyqDf/VevQrS
         deoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062024; x=1792666824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=;
        b=Y0Xni29YuXhNX0P+ME58HAm8Sdndl1UHSz13l2gir1kE76I5IblT3ccdJLYsx1Z6Vn
         GPTo8XXaYk3V96sQIgQO6XNASaM1kydFdF+3rh3KVkCJtyIX4EI+aSmmy1eL7CQ42Aiv
         iIBVpONjsnu7e7aWBrsp/q/FQZ0lNVANjE9PL+5QvuUmH5thO55b0BMs9zu/AsKELuwQ
         4WsSvq/uuYaKVdFGufzobsMNTyAX2+fRfwkvXYYPhf9dsiJdnECFDBGGq717WoqJEE/A
         grIxRQ7RG+SUO+c2A1wMsXcho2ATD8Bek4QR982zygDOsErhjIjWThI13p7EKO8lZBFW
         53sQ==
X-Forwarded-Encrypted: i=1; AKwUvBy27Z1rvPfqeh/76ZE8syaVaQSgATgKv1n8RGvIkjLc9npOcvl2CXoVqLyArekJSE4dweE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIQ/bN2uxAWc1x3JOaKMGEmaY2T9JyObNU04gnhfUxvDn1u/ixn
	wNZlWikCnlCcSi3/Qq+2KIiYQ3wO3zdsRMXQN4DN7hAf3YH+VV/zAvmPWxkInSB6+YVanBOo+58
	bAz5QBVYduU29wxwGkNMW+mCHagVV5yVNkEQX2XAeR7h1y5gIPjEo5ZQ=
X-Gm-Gg: AYBFou0gQvAh+0dLfaqgRnkB1vrJ0dU4e/7zA4S5RYXmYjWxTR9V7Pe5NN70NVE7hJQ
	u4fXq4YEKtGE7B0SJ1f83H1S05aIh0+CAp7FJBvKEI7WLMuSvoknV/TNZpk9FwZvHBx6Yl+SuX2
	1p+oWWvkyTqUHfYYvpvGVZYoPWogx1Rdydn/92Y+fOuXw9ew7RpajTuG3E+AjORZWRV4iuHJIqR
	wITbNXbhDjs4tQ9AlvPwxoTbxpsMQ2yGiGJLgtq9KPS7nHsvq6xW0Y94UOCTnwHVT4bRtaX8PEL
	hRIA/n/Ulj5lKlQ8JJnrPdKrFswMQNGFgm3awAErW2SihAgKzOvfS+Wplcy9toZFBx0G0ogMlIW
	sLCBpZmHVhETXnZAF5+enD5b2IEQ=
X-Received: by 2002:a17:90b:1e41:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ab3a9726admr16268699a91.56.1792062023468;
        Thu, 15 Oct 2026 04:00:23 -0700 (PDT)
X-Received: by 2002:a17:90b:1e41:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ab3a9726admr16268644a91.56.1792062022861;
        Thu, 15 Oct 2026 04:00:22 -0700 (PDT)
Received: from [10.204.66.72] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a31aa8sm2134817a91.0.2026.10.15.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:00:22 -0700 (PDT)
Message-ID: <fe833dd6-0124-428f-95a4-bfc48c3a0dc7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:30:15 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXwAX3p1glUrT9
 U5y3MAueHP/WKxpYSiZfliacVTnE5++1aYtIMXUVTfM5ODIAFkKouEz/PnXEWhr+suk+N3tJzhg
 Brb7rukUJbh32nhBztkurMUETW3VVRY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX1K0FcfVpipp0
 6FtLxMwiteE01Je/7eQgS87dfQYH2iAocUPdIKRQSyNkYXBt1c43Q12tceS6lJT9OyZ0GrQLsOL
 8UuyHguW8Ue8e2Gs4MybOmRC+3VHZrpWJ39bFrqlVPkfksfk921Sbiv+a8K3MCQH85OSxhyP1Sy
 XJ1eMvlx4HO61QEk06j/rbHh59PMLYoK77TXqqg9yh1Vz/jkrqd33L5XxFwvkynWZLj+dimBvwD
 AoN0kpMPxWv4Rx7cnEVIpYjEKlM5IkM3uTnjHq2hZgozqIMllKIkVTxarIqwLHdJfulxIZh1IbI
 dtfmyHhXr1TdgZhX8rNHIbVq+KmTgGe3CjYyGbCf8hqumoeEXXHKbMQu617z9k2a4mPN92D+6vn
 M96vUGHasIUjRpKaC3FBekvNQ0t15eRfjnEUdwjB8c3zFlqkedpvYdRRfDVVC+lQnUkKQ0Ij6uC
 TOlUBkHwxGAwfYfQBaA==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0b248 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hpE6E10lv6cxlDq8Q4MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: i5eXhKZBWzQ7zq_6lytxaVr4nkAZ8QIw
X-Proofpoint-ORIG-GUID: i5eXhKZBWzQ7zq_6lytxaVr4nkAZ8QIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043



On 14-10-2026 16:02, Jishnu Prakash wrote:
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

> ---
>  drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 22 deletions(-)
> 

-- 
Regards,
Nihal Kumar Gupta

