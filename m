Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632535C6AA
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 10:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986579; cv=none; b=sBN3xGDFs5EI0fvEdfFra+E949kG8Y5zJulqJk3Xr8rM3FthpR1ndpFZJ2GM5Xq1pIqaIrdNDWf7dp1I4RHzRsh3x9lHUH62lLKLcGbfDc1sYP+Q5sFPzo/9cK5vrjx+tqsbqvzPxd4KrIUe1mZNFLP/R+lzoLt7O6I8V6P2bcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986579; c=relaxed/simple;
	bh=zcOJMzXLl69/p3oVhEE7hTMKifMoLsS/KeY1YBgSWAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDhbqJPRn3PX3HoYAuO3X2O/lp+tPsahO1vYG0iOGw5edbCLKu5gn5kHn4SDyvdlC0C1Z32pTwQteeMkStYd+sSIwEX51JdYibejkf8FXupbUoFYT3XTnOxi1WPVw4I2g6J/FxvCKNQZbcV5EJwP1REqeShV1jUrs0nKeutXlRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUlzHn8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRnl20L5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUlzHn8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRnl20L5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7EFgG759173
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 10:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	er85m/VpcaNBY8p0HNqxGDH04XxFCaQjcVPnP1W36m8=; b=LUlzHn8YRnxEXbvJ
	XKG1aPrc4ADfe5ljDpO39tdY8iQBQj3etE36KwnOG7OI33BORLbPEmIHiIhaH/yB
	06UpGp0i0/pCDsykgV8t1r60dbrVjGREQesKRCOiGG5x1MZnkytdgxkf54fN5o/v
	rfZlF8i0nGphho/biw5plN7bUZYGqQiXW/Be+z7/iQrErwC29LTvBziqo3fCoyAc
	RWnwZMBiWo1j6oEX2oS/6g54pUVsXRfu0uNSZv2Prx+ubEwVyiMg+65Yo7trFjp8
	JWCenn1jAWhtKLKbTH36jlcybklQtb7+rtYuME5LZ59WlUHtCEh3aCZd1xXYUxg6
	YDegUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0118sgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 10:29:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so4349466a91.3
        for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 03:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789986576; x=1790591376; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er85m/VpcaNBY8p0HNqxGDH04XxFCaQjcVPnP1W36m8=;
        b=eRnl20L5RYjXbVwPNOhoMp1c/n92fAEgj5oB1tFqHuBnjxggyoo+tsuAb2uueIbcZO
         /xgmwyckiWQELEFOSvng68j2o4JjE/WBVHorphS2rvCETN+NYsr/N93SaK7+ob8rZfJ5
         BEoiGPps6InRe5EPrLqdtGvbpTBoIdKGhahb3CzNKsluiW1QkrR6RoEfNVlIQM8zTIv3
         aX/ew8Qs/CM4NTqyJ6V9B5vU1mYof2ILaBsWwObZDfrviUfiz/q/wtbrlWUgSplTt1/y
         7zDp182iSplMytTEUFifSCOXnYD0nHIu9SaJSZMnUCeY0EHrQCkrOIPQ9/MpGxP+/OCC
         uUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986576; x=1790591376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=er85m/VpcaNBY8p0HNqxGDH04XxFCaQjcVPnP1W36m8=;
        b=JO+3lQmRoKKu8L/IUe7SRGNmZZnj8I5ZI+RL8K/5zFhgljmiapPJQzvyFzfT24oPTZ
         xkphj+EFtkZJVpKMc483Aj+MUWAIECDAEP4QJIQbQq/dUz5JvdtH6YYMUw0SQP5RqDYa
         ihn3mhUBL0TIZKEQRo41lZZoIqWdQnH7bJ9vYPVED6U0usOY8HM19ntlHdxtuhzWgcpc
         veeb7UTWMVkexefEHsfH4B+Ewt3LtvU91u3+f/RnxoF5hVWyjIcjeSTyOt44+uhXx0Hj
         p3mTBBDdkdeaU0A4icl7GjffdasIY/SvaQscd1xN4fAUFCoTGe4GR/zQYXZORi0MlSxq
         HJ5g==
X-Forwarded-Encrypted: i=1; AKwUvBxoYQ09pnooloXaZt5vFbW0zlR4qmviVKeILuIYOfWPUte06kVgGc7tvhDnjA9kH/QdKpI=@lists.linux.dev
X-Gm-Message-State: AFuF++ku8OrFsac0GIr2FmlCdYmGDOa9aUOv+PWhd5j3WMLkvQQOEG/g
	23ChHVbJ4l8vP6gLgPj2qSo4p/NCSuHo4wipbvLRHpwOVm19SCFsFfW3B6qbS3+QkcANOXZ2UTb
	NypR264N8xitrGtVbdMcnmTC+hEDpXu6jo4kfMfY1JOQDoKJTFy6US+c=
X-Gm-Gg: AYBFou0utBnljQIy4O7ruAGtrMKjk12VcLSgQh7dsilkMlOxO/VbJa5IPa6S4uiLAlK
	1C7Vvt8l76goJc0/9Ku7Qon/hU6dBLlptF44kYFNeFZmvxc/nDALIxUC8wQ32pCp3t6ytiJUM5J
	PVM89+AVrcCWCwM/RBeRhiIt7I2MmqZaZ4z5FyarC1XYO+QxgKuCBrBBCYlD6/xK8oLeRA3alTD
	k2EDYKMZkEHqlxJrbYMVJH5XSJ8NY0/x5YQjSdTweWrAMTy+lszAXBdTmSuSs3fUPowTaiFA7pk
	SmmQoy0bTBZeqOJljPk0w8Gd5r5VI5hBOVReJg4sfQ8bdrInQ9/48nWiuZv75UigKLa2+n7pPZ3
	s3EDBiod/R/2/2DcbFQy5iHrW6ZFFuKE=
X-Received: by 2002:a17:90a:d40b:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0574f5cf6mr1247956a91.39.1789986575750;
        Mon, 21 Sep 2026 03:29:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0574f5cf6mr1247934a91.39.1789986575299;
        Mon, 21 Sep 2026 03:29:35 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm29762133c88.5.2026.09.21.03.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 03:29:34 -0700 (PDT)
Message-ID: <0e6877df-0306-474f-bc25-aa7d3fd2f53c@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:59:22 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
 <20260918220634.GA2441717-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260918220634.GA2441717-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k0_an-871RGWb1_gZQWLxzH9qJjFqK-k
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab10710 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8elzRJZBfmQ5qZguGEwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1MSBTYWx0ZWRfX1CijoJs3V+ea
 nbDxmWhB6fyXGf+gThtWP/e/N07jLY3PqkaiO6IKFvSmhlDtWvVXuTzlgVDJmEQjaKE2kQCGDJz
 UQyjLrnQOBfCI5d0+rQLhJOfI9RnJTAmca5OsOsRIPJPsI1aHe/wxOsJMG07SIB2bM74/LfBArZ
 TZ1DH3oXZ/H5AkPicKIkdfE9K++9vTVpELDZaBaPeFStGSO7vSlE6I+liPUyHkiSzTl2hlRzaP/
 cELlr5m0JfoHVhQldvz52T+l6JoAtEjjLvFYIXeNW8uFdU7kABfqAuqgEI+oQq3fImfkPrJeCOC
 bvX08sWVgfnadrDFtE2be3tq3fioq/jgLWBRGNR+ovPpkJopbg0UfvjQCT5y5UPwGivnbv1skv9
 2BQdHJLWBmS8xRrE1EL8PVtpc7FdSU0602yAxVp1VpgmplEKlcPnDDyOcpqhCRYp48Ky1rymEUH
 uaEWdp68l5qobu/OT1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1MSBTYWx0ZWRfX/93oy6e2UYeU
 X4JInsdrK7Gep0meAkoLPb0qZ7OHCS2jKJ9mu5d3M5UZ5WNsT8HibZlO663wIppBpXG91vA/nY+
 U4+aguFOfGb7Tmnb4XbRxVDltFIoeEc=
X-Proofpoint-ORIG-GUID: k0_an-871RGWb1_gZQWLxzH9qJjFqK-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210151



On 9/19/2026 3:36 AM, Rob Herring wrote:
>> +            minimum: 0x80000000
>> +          - description:
>> +              arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
> Drop. Types are per property, not per item.

Ack.

>> +          - description: arg3 (cookie_lo in 3-cell form)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
> Drop.

something like this?

   items:
     - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
       minimum: 0x80000000
     - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell 
form)
     - description: arg3 (cookie_lo in 3-cell form)

   description: |
     Describes a PSCI SYSTEM_RESET2 vendor-specific reset type.


thanks,
Shivendra
