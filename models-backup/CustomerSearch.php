<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Customer;

/**
 * CustomerSearch represents the model behind the search form of `app\models\Customer`.
 */
class CustomerSearch extends Customer {

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['id', 'channel', 'typework', 'last_dep', 'user_id'], 'integer'],
            [['project_name', 'customer', 'tel', 'channel_etc', 'lineid', 'address', 'detail', 'file', 'date_getjob', 'time_getjob', 'create_date', 'cur_dep'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios() {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params) {
        $query = Customer::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'channel' => $this->channel,
            'channel_etc' => $this->channel_etc,
            'lineid' => $this->lineid,
            'typework' => $this->typework,
            'date_getjob' => $this->date_getjob,
            'time_getjob' => $this->time_getjob,
            'cur_dep' => $this->cur_dep,
            'last_dep' => $this->last_dep,
            'create_date' => $this->create_date,
            'user_id' => $this->user_id,
        ]);

        $query->andFilterWhere(['like', 'project_name', $this->project_name])
                ->andFilterWhere(['like', 'customer', $this->customer])
                ->andFilterWhere(['like', 'tel', $this->tel])
                ->andFilterWhere(['like', 'channel_etc', $this->channel_etc])
                ->andFilterWhere(['like', 'lineid', $this->lineid])
                ->andFilterWhere(['like', 'address', $this->address])
                ->andFilterWhere(['like', 'detail', $this->detail])
                ->andFilterWhere(['like', 'file', $this->file]);

        return $dataProvider;
    }

}
